//
// fragment_main
//
#version 460
precision highp float;
precision highp int;

layout(binding = 0, std430)
buffer f_prevent_dce_block_ssbo {
  ivec4 inner;
} v;
uniform highp isamplerCubeArray f_arg_1_arg_2;
ivec4 textureGather_aaf6bd() {
  vec3 arg_3 = vec3(1.0f);
  int arg_4 = 1;
  vec3 v_1 = arg_3;
  vec4 v_2 = vec4(v_1, float(arg_4));
  ivec4 res = textureGather(f_arg_1_arg_2, v_2, int(1u));
  return res;
}
void main() {
  v.inner = textureGather_aaf6bd();
}
//
// compute_main
//
#version 460

layout(binding = 0, std430)
buffer prevent_dce_block_1_ssbo {
  ivec4 inner;
} v;
uniform highp isamplerCubeArray arg_1_arg_2;
ivec4 textureGather_aaf6bd() {
  vec3 arg_3 = vec3(1.0f);
  int arg_4 = 1;
  vec3 v_1 = arg_3;
  vec4 v_2 = vec4(v_1, float(arg_4));
  ivec4 res = textureGather(arg_1_arg_2, v_2, int(1u));
  return res;
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  v.inner = textureGather_aaf6bd();
}
//
// vertex_main
//
#version 460


struct VertexOutput {
  vec4 pos;
  ivec4 prevent_dce;
};

uniform highp isamplerCubeArray v_arg_1_arg_2;
layout(location = 0) flat out ivec4 tint_interstage_location0;
ivec4 textureGather_aaf6bd() {
  vec3 arg_3 = vec3(1.0f);
  int arg_4 = 1;
  vec3 v = arg_3;
  vec4 v_1 = vec4(v, float(arg_4));
  ivec4 res = textureGather(v_arg_1_arg_2, v_1, int(1u));
  return res;
}
VertexOutput vertex_main_inner() {
  VertexOutput v_2 = VertexOutput(vec4(0.0f), ivec4(0));
  v_2.pos = vec4(0.0f);
  v_2.prevent_dce = textureGather_aaf6bd();
  return v_2;
}
void main() {
  VertexOutput v_3 = vertex_main_inner();
  gl_Position = vec4(v_3.pos.x, -(v_3.pos.y), ((2.0f * v_3.pos.z) - v_3.pos.w), v_3.pos.w);
  tint_interstage_location0 = v_3.prevent_dce;
  gl_PointSize = 1.0f;
}
