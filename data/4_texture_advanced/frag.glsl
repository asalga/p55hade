/*
	Andor Salga
	April 2015
	Normal Mapping demo
*/

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 iResolution;
uniform vec3 iCursor;

uniform sampler2D diffuseMap;
uniform sampler2D normalMap;

void main(){
	vec2 uv = vec2(gl_FragCoord.xy / 512.0);
	
	// should we do this in pjs?
	uv.y = 1.0 - uv.y;

	vec2 p = vec2(gl_FragCoord);

	float mx = p.x - iCursor.x;
	float my = p.y - (iResolution.y - iCursor.y);
	float mz = 500.0;

	// use point light
	vec3 rayOfLight = normalize(vec3(mx, my, mz));

	// TODO: comment
	vec3 normal = vec3(texture2D(normalMap, uv)) - 0.5;
	normal = normalize(normal);

	float nDotL = max(0.0, dot(rayOfLight, normal));
	vec3 reflection = normal * (2.0 * (nDotL)) - rayOfLight;

	vec3 col = vec3(texture2D(diffuseMap, uv)) * nDotL;

	if(iCursor.z == 1.0){
		float specIntensity = max(0.0, dot(reflection, vec3(.0, .0, 1.)));
		float specRaised = pow(specIntensity, 20.0);
		vec3 specColor = specRaised * vec3(1.0, 0.5, 0.2);
		col += specColor;
	}

	gl_FragColor = vec4(col, 1.0);
}
