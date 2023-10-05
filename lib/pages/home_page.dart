import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/pages/search_page.dart';

import 'PageWithData.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return  SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body:
      BlocBuilder<WeatherCubit,WeatherState>(
        builder: (context, state) {
          if( state is WeatherSuccess){
            return  const PageWithData();
          }
          else if(state is WeatherInitial){
            return    Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:const[
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
          }

          else{
           return const Center(child: Text('opps , there is an error ,please try again ..'));


          }
          
          
        },
     
        
      ),


    
    );
  }
}
