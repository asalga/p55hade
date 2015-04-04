// Making it circular

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 iResolution;
uniform sampler2D texture;

void main(){
	vec2 p = (gl_FragCoord.xy / iResolution.xy) * 2.0 - 1.0;
	float col = length(p);
	gl_FragColor = vec4(vec3(col), 1.0);
	//gl_FragColor = texture2D(texture, texel);
}
