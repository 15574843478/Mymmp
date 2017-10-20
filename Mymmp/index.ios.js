/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
  NativeModules
} from 'react-native';

var RNBridgeModule = NativeModules.RNBridgeModule;

export default class Mymmp extends Component {
  render() {
    return (
      <View style={styles.container}>
	<TouchableHighlight  
                style={styles. button}
                underlayColor="#d9d9d9"  
                onPress={()=>RNBridgeModule.RNOpenVC('测试')} >
              <Text style={styles.exittext} allowFontScaling={false}>
                   RN按钮跳转oc原生  
              </Text>  

        </TouchableHighlight>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
      allowFontScaling:'false'
  },
    button: {
        padding: 10,
        borderColor: 'blue',
        borderWidth: 1,
        borderRadius: 5
    },
});
AppRegistry.registerComponent('Mymmp', () => Mymmp);
