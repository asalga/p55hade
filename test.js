/*
	@pjs preload='data/images/c512.jpg,data/images/n512.jpg'
*/

PShader shader1;
PImage img, img2;

/*
	TODO: fix so we don't have to call size() again
*/
window.onresize = function(){
	size(window.innerWidth, window.innerHeight, P3D);
	shader(shader1);	
};

void setup(){
	img = loadImage('data/images/c512.jpg');
	img2 = loadImage('data/images/n512.jpg');

	size(window.innerWidth, window.innerHeight, P3D);

	shader1 = loadShader("data/4_texture_advanced/frag.glsl", 'data/vert.glsl');
	shader(shader1);
	texture(img);
	
	// pjs explicitly sets the default wrapping to clamp, override that.
	var p5 = Processing.getInstanceById('cvs');
	var ctx = p5.externals.context;
	
	ctx.texParameteri(ctx.TEXTURE_2D, ctx.TEXTURE_WRAP_T, ctx.REPEAT);
	ctx.texParameteri(ctx.TEXTURE_2D, ctx.TEXTURE_WRAP_S, ctx.REPEAT);

	shader1.set('normalMap', img2);
}

void draw(){
	rect(0, 0, width, height);
}
