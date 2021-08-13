import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/domain/entities/cast_entity.dart';
import 'package:movie_app/presentation/blocs/images/images_bloc.dart';
import 'package:movie_app/presentation/blocs/person/person_bloc.dart';
import 'package:movie_app/presentation/blocs/person/person_event.dart';
import 'package:movie_app/presentation/blocs/person/person_state.dart';
import 'package:movie_app/presentation/journeys/person_details/person_big_poster.dart';
import 'package:movie_app/presentation/journeys/person_details/person_bio.dart';
import 'package:movie_app/presentation/journeys/person_details/person_other_details.dart';

import 'cast_big_poster.dart';

class PersonDetailsScreen extends StatefulWidget {
  final CastEntity castEntity;

  const PersonDetailsScreen({
    Key? key,
    required this.castEntity,
  }) : super(key: key);

  @override
  _PersonDetailsScreenState createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  late final PersonBloc _personBloc;
  late final ImagesBloc _imagesBloc;

  @override
  void initState() {
    _personBloc = getItInstance<PersonBloc>();
    _personBloc.add(PersonDetailsLoadedEvent(widget.castEntity.id));
    _imagesBloc = _personBloc.imagesBloc;
    super.initState();
  }

  @override
  void dispose() {
    _personBloc.close();
    _imagesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _personBloc),
        BlocProvider.value(value: _imagesBloc),
      ],
      child: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          if (state is PersonDetailsLoaded) {
            final personDetail = state.personEntity;
            if (personDetail.profilePath!.isEmpty ||
                personDetail.biography!.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CastBigPoster(
                    castEntity: widget.castEntity,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text("Data is Not available ",
                      style: Theme.of(context).textTheme.headline6),
                ],
              );
            } else if (personDetail.profilePath!.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonBigPoster(personEntity: personDetail),
                    SizedBox(height: 20),
                    PersonBio(personBio: personDetail.biography.toString()),
                    PersonOtherDetails(
                        fieldName: "Birthday",
                        fieldData: personDetail.birthday.toString()),
                    PersonOtherDetails(
                        fieldName: "Place of Birth ",
                        fieldData: personDetail.placeOfBirth.toString()),
                    PersonOtherDetails(
                        fieldName: "Popularity",
                        fieldData: personDetail.popularity.toString()),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text("No Details"),
            );
          } else if (state is PersonDetailsError) {
            return Center(
              child: Text("No Details"),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    ));
  }
}
