//
// fragment_main
//
RWTexture2DArray<float4> arg_0 : register(u0, space1);

void textureStore_9d8668() {
  arg_0[int3((1).xx, int(1u))] = (1.0f).xxxx;
}

void fragment_main() {
  textureStore_9d8668();
  return;
}
//
// compute_main
//
RWTexture2DArray<float4> arg_0 : register(u0, space1);

void textureStore_9d8668() {
  arg_0[int3((1).xx, int(1u))] = (1.0f).xxxx;
}

[numthreads(1, 1, 1)]
void compute_main() {
  textureStore_9d8668();
  return;
}
