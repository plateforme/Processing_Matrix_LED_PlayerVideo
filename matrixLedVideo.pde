import javax.swing.*; 
import processing.video.*;
import com.heroicrobot.dropbit.registry.*;
import com.heroicrobot.dropbit.devices.pixelpusher.Pixel;
import com.heroicrobot.dropbit.devices.pixelpusher.Strip;
import java.util.*;
Movie myMovie;
DeviceRegistry registry;
PusherObserver observer;

void setup() {
  size(720,1280);
   
  myMovie = new Movie(this, "1.mov");
  myMovie.loop();
  frameRate(30);
  registry = new DeviceRegistry();
  observer = new PusherObserver();
  registry.addObserver(observer);
  registry.setAntiLog(true);
}

void draw() {
  
  rotate(radians(90)); 
  image(myMovie,-0,-720);
 
  scrape();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

