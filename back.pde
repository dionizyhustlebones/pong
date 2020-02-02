
class Dick {
    public float x, y, w, h;

    Dick(float x, float w, float h) {
        this.x = x;
        this.w = w;
        this.h = h;
        this.y = height/2-h/2;
    }

    void draw() {
        rect(this.x, this.y, this.w, this.h);
    }

    void move(float s) {
        this.y += s;
        if ( this.y < 0 ) {
            this.y = 0;
        }
        if ( this.y > height-this.h ) {
            this.y = height-this.h;
        }
    }
}

class Ball {
    public float x, y, r;
    public Wektor velocity;

    Ball(float r) {
        this.x = width/2;
        this.y = height/2;
        this.r = r;

        this.velocity = new Wektor (0, 0);
    }

    void draw() {
        //fill
        ellipse(this.x, this.y, this.r*2, this.r*2);
    }

    void start() {
        this.x = width/2;
        this.y = height/2;

        this.velocity.y = random(-10, 10);
        this.velocity.x = 5;
        int d = round(random(0, 1));
        if (d == 0) {
            this.velocity.x = -this.velocity.x;
        }
    }

    void physics() {
        this.velocity.x = constrain(this.velocity.x, -50, 50);
        this.velocity.y = constrain(this.velocity.y, -30, 30);
        this.x += this.velocity.x;
        this.y += this.velocity.y;
    }

    void checkCollision() {
        if ( this.y < 0+r || this.y > height-r ) {
            this.velocity.y = -this.velocity.y;
        }
    }

    void dickCollision(Dick paleta, float s) {
        if (
            (this.x+this.r > paleta.x && this.x-this.r < paleta.x+paleta.w) &&
            (this.y+this.r > paleta.y && this.y-this.r < paleta.y+paleta.h)
        ) {
            this.velocity.x = -this.velocity.x*1.15;
            float m = random(0, 0.3);
            this.velocity.y += s*m;

            if ( this.x > width/2 ) {
                this.x -= r;
            } else {
                this.x += r;
            }
        }
    }
}

class Wektor {
    public float x, y;
    Wektor(float x, float y) {
        this.x = x;
        this.y = y;
    }
}
