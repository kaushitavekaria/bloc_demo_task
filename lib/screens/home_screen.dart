import 'package:bloc_task/bloc/search_bloc.dart';
import 'package:bloc_task/reopsitory/api_repository.dart';
import 'package:bloc_task/screens/add_response_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(ApiRepository())..add(GetSearchList()),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          // body: blocBody(context: context, state: state),
          body: state is SearchInitial || state is SearchLoading
              ? const Center(child: CircularProgressIndicator())
              : state is SearchLoaded
                  ? RefreshIndicator(
                      onRefresh: () async => context
                          .read<SearchBloc>()
                          .add(const GetRefreshList(showNotification: true)),
                      child: ListView.builder(
                          itemCount: state.searchModel.items!.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              child: Card(
                                color: Theme.of(context).primaryColor,
                                child: ListTile(
                                  title: Text(
                                    state.searchModel.items?[index].fullName ??
                                        '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    state.searchModel.items?[index].visibility
                                            .name ??
                                        '',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(state
                                            .searchModel
                                            .items?[index]
                                            .owner
                                            .avatarUrl ??
                                        ''),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : state is SearchError
                      ? Center(
                          child:
                              Text(state.message ?? 'Something went wrong!!!'),
                        )
                      : Container(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => AddResponseScreen(searchBloc: context.read<SearchBloc>(),)));
            },
            child: const Icon(Icons.add),
          ),
        );
      }),
    );
  }
}
