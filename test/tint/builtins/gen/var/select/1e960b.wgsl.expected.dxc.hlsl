//
// fragment_main
//
RWByteAddressBuffer prevent_dce : register(u0);

uint2 select_1e960b() {
  uint2 arg_0 = (1u).xx;
  uint2 arg_1 = (1u).xx;
  bool2 arg_2 = (true).xx;
  uint2 res = (arg_2 ? arg_1 : arg_0);
  return res;
}

void fragment_main() {
  prevent_dce.Store2(0u, asuint(select_1e960b()));
  return;
}
//
// compute_main
//
RWByteAddressBuffer prevent_dce : register(u0);

uint2 select_1e960b() {
  uint2 arg_0 = (1u).xx;
  uint2 arg_1 = (1u).xx;
  bool2 arg_2 = (true).xx;
  uint2 res = (arg_2 ? arg_1 : arg_0);
  return res;
}

[numthreads(1, 1, 1)]
void compute_main() {
  prevent_dce.Store2(0u, asuint(select_1e960b()));
  return;
}
//
// vertex_main
//
uint2 select_1e960b() {
  uint2 arg_0 = (1u).xx;
  uint2 arg_1 = (1u).xx;
  bool2 arg_2 = (true).xx;
  uint2 res = (arg_2 ? arg_1 : arg_0);
  return res;
}

struct VertexOutput {
  float4 pos;
  uint2 prevent_dce;
};
struct tint_symbol_1 {
  nointerpolation uint2 prevent_dce : TEXCOORD0;
  float4 pos : SV_Position;
};

VertexOutput vertex_main_inner() {
  VertexOutput tint_symbol = (VertexOutput)0;
  tint_symbol.pos = (0.0f).xxxx;
  tint_symbol.prevent_dce = select_1e960b();
  return tint_symbol;
}

tint_symbol_1 vertex_main() {
  VertexOutput inner_result = vertex_main_inner();
  tint_symbol_1 wrapper_result = (tint_symbol_1)0;
  wrapper_result.pos = inner_result.pos;
  wrapper_result.prevent_dce = inner_result.prevent_dce;
  return wrapper_result;
}
