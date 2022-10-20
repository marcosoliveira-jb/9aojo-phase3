import 'package:flutter/material.dart';
import 'package:ordem_servico/components/service_tile.dart';
import 'package:ordem_servico/provider/services.dart';
import 'package:ordem_servico/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ServiceList extends StatelessWidget{

    @override
    Widget build(BuildContext context){

        final Services services = Provider.of(context);

        return Scaffold(
            appBar: AppBar(
                title: Text('Lista de Serviços'),
                actions: <Widget>[
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(
                        AppRoutes.SERVICE_FORM
                      );
                    }, 
                    padding: const EdgeInsets.all(10),
                    icon: Icon(Icons.add)
                  )
                ],
            ),//AppBar
            body: ListView.builder(
                itemCount: services.count,
                itemBuilder: (ctx, i) => ServiceTile(services.all.elementAt(i))
            )
        );
    }
}