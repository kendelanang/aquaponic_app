#include <ESP8266WiFi.h>
#include <FirebaseArduino.h>

#define FIREBASE_HOST "aquaponics-4c4a1-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "0Ra2rFkBwcB26rmEUjXY4fnbewU9Eol06DLs5b02"
#define WIFI_SSID "Wasichock"
#define WIFI_PASSWORD "emotsenyum"

const int relay1 = D2; //pin2
const int relay2 = D3;
const int relay3 = D4;

int n = 0;
int pH_Value; 
float Voltage;

int relayON = LOW; //relay nyala
int relayOFF = HIGH; //relay mati

void setup() {
  Serial.begin(115200);
  
  pinMode(relay1, OUTPUT);
  pinMode(relay2, OUTPUT);
  pinMode(relay3, OUTPUT);
  pinMode(pH_Value, INPUT); 

  digitalWrite(relay1, relayOFF);
  digitalWrite(relay2, relayOFF);
  digitalWrite(relay3, relayOFF);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

void loop() {
  //Serial.println(Firebase.getString("test/phup"));
  pH_Value = analogRead(A0); 
  Voltage = pH_Value * (5.0 / 1023.0);
  String voltase = String(Voltage); 
  Serial.println(Voltage); 
  Firebase.setString("test/ph", voltase);
  delay(200);
  if (Firebase.getString("test/phup") == "on"){
    digitalWrite(relay1, relayON);
    digitalWrite(relay2, relayOFF);
  }
  if (Firebase.getString("test/phdown") == "on"){
    digitalWrite(relay2, relayON);
    digitalWrite(relay1, relayOFF);
  }
  if (Firebase.getString("test/phup") == "off" && Firebase.getString("test/phdown") == "off"){
    digitalWrite(relay1, relayOFF);
    digitalWrite(relay2, relayOFF);
  }
}

void relay()
{
    //relay1
  digitalWrite(relay1, relayON);
  delay(1000);
  digitalWrite(relay1, relayOFF);
  delay(1000);
  digitalWrite(relay2, relayON);
  delay(1000);
  digitalWrite(relay2, relayOFF);
  delay(1000);
  digitalWrite(relay3, relayON);
  delay(1000);
  digitalWrite(relay3, relayOFF);
  delay(1000);
}
