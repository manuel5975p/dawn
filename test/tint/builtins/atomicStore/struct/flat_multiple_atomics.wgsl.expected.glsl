#version 310 es


struct S {
  int x;
  uint a;
  uint b;
};

shared S wg;
void compute_main_inner(uint tint_local_index) {
  if ((tint_local_index < 1u)) {
    wg.x = 0;
    atomicExchange(wg.a, 0u);
    atomicExchange(wg.b, 0u);
  }
  barrier();
  atomicExchange(wg.a, 1u);
  atomicExchange(wg.b, 2u);
}
layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main_inner(gl_LocalInvocationIndex);
}
