#ifdef GL_ES
precision mediump int;
precision mediump float;
#endif

uniform vec2 iResolution;

float radius = iResolution.x/2.0;

const vec3 forwardVec = vec3(0,0,1);

/*
	The the normal vector for a particular fragment
*/
vec3 getNormal(in vec2 point ){
	// Getting the normal from a point is fairly straightforward
	// 1) get the distance from the center of the sphere

	// 2) create an edge normal vector. This is a vector
	// that is on the plane as vector from the center to this point

	// 3) based on how far this fragment is from the center, we'll use
	// a different weight to lerp it.

	// Need to figure out how far the current point is from
	// the center to lerp it.
	float distanceFromCenter = distance(point, iResolution.xy/2.0);
	float weight = distanceFromCenter / radius;
	vec3 edgeNormal = normalize(vec3(point - iResolution.xy, 0));

	// why doesn't this need to be normalized?
	return mix(forwardVec, edgeNormal, weight);
}

void main(){
	vec2 center = vec2(iResolution.xy) / 2.0;

	// If the point is within a certain radius, then we color it.
	if(distance(center, gl_FragCoord.xy) < radius){
		vec3 n = vec3(getNormal(gl_FragCoord.xy));
		vec3 l = vec3(0,0,1);
		vec3 col = vec3(dot(n,l));
		gl_FragColor = vec4(col, 1);
	}
	else{
		gl_FragColor = vec4(0,0,0,1);
	}	
}
