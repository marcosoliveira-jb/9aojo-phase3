import 'package:flutter/material.dart';
import 'package:ordem_servico/components/user_tile.dart';
import 'package:ordem_servico/provider/users.dart';
import 'package:ordem_servico/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget{

    @override
    Widget build(BuildContext context){

        final Users users = Provider.of(context);

        return Scaffold(
            appBar: AppBar(
                title: Text('Lista de Prestadores'),
                actions: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(
                        AppRoutes.USER_FORM
                      );
                    }, 
                    padding: const EdgeInsets.all(10),
                    icon: Icon(Icons.add)
                  )
                ],
            ),//AppBar
            body: ListView.builder(
                itemCount: users.count,
                itemBuilder: (ctx, i) => UserTile(users.all.elementAt(i))
            )
        );
    }
}