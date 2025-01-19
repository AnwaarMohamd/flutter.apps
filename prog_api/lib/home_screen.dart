import 'package:flutter/material.dart';
import 'package:prog_api/cubit/my_cubit.dart';
import 'package:prog_api/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];

  User user = User();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    //BlocProvider.of<MyCubit>(context).emitGetUserDetails(6945439); // ممكن تحطه في variable و تباصيه
    // BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(
    //   name: 'anwaaaaar',
    //   email: 'anwaar213mohmed@gmail.com',
    //   gender: 'female',
    //   status: 'active'
 // ));
    BlocProvider.of<MyCubit>(context).emitDeleteUser('7623268');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GetAllUsers) {
          //       usersList = state.allUsersList;
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.all(8),
          //         itemCount: usersList.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             height: 50,
          //             color: Colors.amber,
          //             child: Center(
          //                 child: Text(usersList[index].email.toString())),
          //           );
          //         },
          //       );
          //     } else {
          //       return CircularProgressIndicator();
          //     }
          //   },
          // )
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GetUserDetails) {
          //       user = state.userDetails;
          //       return Container(
          //         height: 50,
          //         color: Colors.amber,
          //         child: Center(child: Text(user.name.toString())),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is CreateNewUser) {
          //       user = state.newuser;
          //       return Container(
          //         height: 50,
          //         color: Colors.amber,
          //         child: Center(child: Text(user.name.toString())),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
          //  BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is DeleteUser) {
          //      // user = state.newuser;
          //       return Container(
          //         height: 50,
          //         color: Colors.amber,
          //         child: Center(child: Text((state).data.toString())),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
