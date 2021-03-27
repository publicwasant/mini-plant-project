import 'package:flutter/material.dart';

class Theme {
  Map<String, dynamic> button = {
    'defaultSizes': {
      'small': [150.0, 30.0, 16.0, 12.0],
      'medium': [200.0, 40.0, 16.0, 12.0],
      'large': [250.0, 50.0, 16.0, 12.0]
    },
    'defaultColors': {
      'background' : Colors.lightBlue[800],
      'font' : Colors.white,
      'border' : Colors.grey[800]
    },
    'loginColors': {
      'background' : Colors.green,
      'font' : Colors.white,
      'border' : Colors.white
    },
    'logoutColors': {
      'background' : Colors.red,
      'font' : Colors.white,
      'border' : Colors.white
    },
    'registerColors': {
      'background' : Colors.lightBlue[800],
      'font' : Colors.white,
      'border' : Colors.white
    },
    'notNowColors': {
      'background': Colors.white, 
      'font': Colors.grey,
      'border': Colors.white
    },
    'editColors': {
      'background' : Colors.lightBlue[800].withOpacity(0.0),
      'font' : Colors.lightBlue[800],
      'border' : Colors.lightBlue[800]
    },
    'buyColors': {
      'background' : Colors.lightBlue[800],
      'font' : Colors.white,
      'border' : Colors.white
    },
    'basketColors': {
      'background' : Colors.lightBlue[800].withOpacity(0.0),
      'font' : Colors.lightBlue[800],
      'border' : Colors.lightBlue[800]
    },
    'saveColors': {
      'background' : Colors.lightBlue[800],
      'font' : Colors.white,
      'border' : Colors.white
    },
    'saveColors2': {
      'background' : Colors.deepPurpleAccent,
      'font' : Colors.white,
      'border' : Colors.white
    },
  };

  Map<String, dynamic> buttonTab = {
    'defaultSizes': {
      'small': [400.0, 30.0, 14.0, 12.0],
      'medium': [400.0, 60.0, 16.0, 14.0],
      'large': [400.0, 90.0, 18.0, 16.0],
    },
    'defaultColors': {
      'background': Colors.white,
      'font': Colors.grey[800],
      'border': Colors.grey[300]
    }
  };
  
  Map<String, dynamic> buttonOval = {
    'defaultSizes': {
      'very-small': [50.0, 50.0, 12.0],
      'small': [75.0, 75.0, 14.0],
      'medium': [100.0, 100.0, 14.0],
      'large': [150.0, 150.0, 16.0],
      'very-large': [200.0, 200.0, 18.0]
    },
    'defaultColors': {
      'background': Colors.grey[100],
      'font': Colors.grey[800],
      'border': Colors.grey[300]
    }
  };

  Map<String, dynamic> buttonImage = {
    'defaultSizes': {
      'small': [50.0, 50.0, 16.0, 12.0],
      'medium': [70.0, 70.0, 16.0, 12.0],
      'large': [90.0, 90.0, 16.0, 12.0],
    },
    'defaultColors': {
      'background' : Colors.white.withOpacity(0.0),
      'font' : Colors.grey[800],
      'border' : Colors.grey[800]
    },
  };

  Theme () {
    
  }
}

Theme theme = new Theme();