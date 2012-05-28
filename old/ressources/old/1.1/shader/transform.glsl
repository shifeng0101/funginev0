#define SIZE 40
uniform vec3 scaleArr[SIZE];
uniform vec3 translateArr[SIZE];
uniform vec3 translateOldArr[SIZE];
uniform vec3 rotationArr[SIZE];
uniform vec3 rotationOldArr[SIZE];
uniform vec3 colorArr[SIZE];
uniform float interp;

void main(void)
{
	vec3 scale = scaleArr[gl_InstanceID];
	vec3 translate = translateArr[gl_InstanceID];
	vec3 translateOld = translateOldArr[gl_InstanceID];
	vec3 rotation = rotationArr[gl_InstanceID];
	vec3 rotationOld = rotationOldArr[gl_InstanceID];
	vec3 color = colorArr[gl_InstanceID];

	rotation = rotation*(1+interp)-rotationOld*interp;
	translate = translate*(1+interp)-translateOld*interp;
	mat4 S = mat4(	vec4(scale.x,0,0,0),
              		vec4(0,scale.y,0,0),
              		vec4(0,0,scale.z,0),
              		vec4(0,0,0,1) );
	mat4 T = mat4(	vec4(1,0,0,0),
              		vec4(0,1,0,0),
              		vec4(0,0,1,0),
              		vec4(translate,1));
    float c1 = cos(rotation.x);	
    float s1 = sin(rotation.x);	
    float c2 = cos(rotation.y);	
    float s2 = sin(rotation.y);	
    float c3 = cos(rotation.z);	
    float s3 = sin(rotation.z);	
	mat4 R = mat4(	vec4(c2*c3,-c2*s3,s2,0),
              		vec4(c1*s3+c3*s1*s2,c1*c3-s1*s2*s3,-c2*s1,0),
              		vec4(s1*s3-c1*c3*s2,c1*s2*s3+c3*s1,c1*c2,0),
              		vec4(0,0,0,1));
	gl_Position = gl_ModelViewProjectionMatrix *T*R*S*gl_Vertex; 
	gl_FrontColor = vec4(color,1);
	gl_TexCoord[0]= gl_MultiTexCoord0;
}

//fragment


// Scene buffer
uniform sampler2D tex; 


void main(void)
{ 
  gl_FragColor = gl_Color;
  //gl_FragColor.a = 0.4;
}