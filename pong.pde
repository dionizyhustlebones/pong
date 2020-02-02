
Ball pilka;
Dick paleta1, paleta2;

final float slow = 15;
final float fast = 30;

float speeda = 0;
float speedb = 0;

float speed2a = 0;
float speed2b = 0;

int p1, p2;

void setup() {
    //size(1000, 500);
    fullScreen();
    frameRate(60);


    pilka = new Ball(width*0.01);
    pilka.start();


    float paleta_w = width*0.015;
    float paleta_h = width*0.1;
    paleta1 = new Dick(width*0.05, paleta_w, paleta_h);
    paleta2 = new Dick(width*0.95-paleta_w, paleta_w, paleta_h);

    textSize(50);
}

void draw() {
    background(75);

    pilka.checkCollision();
    pilka.physics();
    pilka.dickCollision(paleta1, speeda+speedb);
    pilka.dickCollision(paleta2, speed2a+speed2b);
    pilka.draw();

    paleta1.move(speeda+speedb);
    paleta1.draw();

    paleta2.move(speed2a+speed2b);
    paleta2.draw();

    if ( pilka.x < 0 ) {
        p2++;
        pilka.start();
    }
    if ( pilka.x > width ) {
        p1++;
        pilka.start();
    }

    text(p1, width/4, 50);
    text(p2, width*0.75, 50);
}

void keyPressed() {
    switch(key) {
    case 'w':
        speeda = -slow;
        break;

    case 's':
        speedb = slow;
        break;

    case 'o':
        speed2a = -slow;
        break;

    case 'l':
        speed2b = slow;
        break;
    case 'q':
        speeda = -fast;
        break;

    case 'a':
        speedb = fast;
        break;

    case 'i':
        speed2a = -fast;
        break;

    case 'k':
        speed2b = fast;
        break;
    }
}

void keyReleased() {
    switch(key) {
    case 'w':
    case 'q':
        speeda = 0;
        break;
    case 'a':
    case 's':
        speedb = 0;
        break;

    case 'o':
    case 'i':
        speed2a = 0;
        break;
    case 'l':
    case 'k':
        speed2b = 0;
        break;

    case 'r':
        pilka.start();
        p1 = 0;
        p2 = 0;
        break;
    }
}
