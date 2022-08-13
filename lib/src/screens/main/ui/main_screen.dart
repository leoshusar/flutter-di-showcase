import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';
import '../bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainBloc>(
      builder: (context, bloc, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Users'),
          ),
          body: StreamBuilder<bool>(
            stream: bloc.loading,
            builder: (context, snapshot) {
              return LoadingOverlay(
                isLoading: snapshot.data ?? false,
                child: StreamBuilder<List<User>>(
                  stream: bloc.users,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: ElevatedButton(
                          onPressed: bloc.loadUsers,
                          child: const Text('Load users'),
                        ),
                      );
                    }
                    
                    final users = snapshot.data!;
                    
                    return Expanded(
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.username),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
