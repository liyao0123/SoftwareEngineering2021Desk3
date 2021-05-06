import {
	Object3D,
	Mesh,
	MeshBasicMaterial,
	CircleGeometry,
	DoubleSide
} from './three.module.js';

var TweenUtils = {};
TweenUtils.tween = function(e, t) {
    var n = new TWEEN.Tween({
        progress: 0
    });
    return n.to({
        progress: 1
    }, e).easing(void 0 !== t ? t : TWEEN.Easing.Linear.None).start(),
    n
}

function r(e, t, n) {
    return e + (t - e) * n
}

class Hotspot extends Object3D {
    constructor( camera, option ) {
        super();

        this.camera = camera;
        this.circles = [];
        this.animationDuration = 5;
        this.minCircleScale = 0;
        this.maxCircleScale = 2;
        this.circleOpacity = 0.9;
        var colors = [0xff0000, 0x0030ff, 0x48ff00];
        for (var t = 0; t < 3; t++) {
            this.addCircle(0xffff00, t);
        }

        this.type = "hotspot";
        this.name = option.name;
        this.position.copy(option.position);
        this.maxSize = void 0 !== option.maxSize ? option.maxSize : 1;
        this.scale.multiplyScalar(this.maxSize);
        this.fadeDuration = 200;
        this.isHotspot = true;
    }

    addCircle(color, i) {
        var circle = new Mesh(new CircleGeometry(20, 32), new MeshBasicMaterial({
            transparent: true,
            color: color,
            side: DoubleSide
        }));
        circle.rotation.y = Math.PI / 2;
        circle.position.x = i * 1;

        this.add(circle);
        this.circles.push(circle);
        circle.opacity = this.circleOpacity;
        circle.renderOrder = 150;
    }

    update(elapsed) {
        this.visible && this.updateCircles(elapsed);
    }

    updateCircles(elapsed) {
        this.circles.forEach(function(circle, index) {
            var r = elapsed + this.animationDuration / this.circles.length * index;
            var i = r / this.animationDuration % 1;
            var scale = this.minCircleScale + (this.maxCircleScale - this.minCircleScale) * TWEEN.Easing.Quadratic.Out(i);
            var a = TWEEN.Easing.Quadratic.In(1 - i);
            circle.scale.set(scale, scale, scale);
            circle.material.opacity = a * circle.opacity;
            
            circle.quaternion.copy(this.camera.quaternion);
        }, this)
    }

    fadeIn() {
        this.visible = true;
        TweenUtils.tween(this.fadeDuration, TWEEN.Easing.Linear.none).onUpdate(function(e) {
            this.circles.forEach(function(circle) {
                circle.opacity = r(0, this.circleOpacity, e)
            }, this)
        }.bind(this));
    }

    fadeOut() {
        TweenUtils.tween(this.fadeDuration, TWEEN.Easing.Linear.none).onUpdate(function(e) {
            this.circles.forEach(function(circle) {
                circle.opacity = r(this.circleOpacity, 0, e);
            }, this)
        }
        .bind(this)).onComplete(function() {
            this.visible = false;
        }
        .bind(this));
    }
};

export default Hotspot;
