<template>
  <div class="row items-center q-pa-md">
    <div class="col image q-pa-md">
      <q-img src="https://static.goanywhere.com/img/contact-us-figure.png" :ratio="16 / 9" />
    </div>
    <div class="col q-pa-lg ">
      <q-card class="shadow-18 q-pa-md bg-orange-2">
        <div class="row justify-center">
          <h5 class="q-ma-md title text-bold">WRITE TO US </h5>
        </div>
        <div class="column">
          <div class=" q-ma-md">
            <label class="text-subtitle2">Full Name<span class="text-red"> *</span></label>
            <q-input color="orange" outlined dense />
          </div>
          <div class=" q-ma-md">
            <label class="text-subtitle2">Email Address<span class="text-red"> *</span></label>
            <q-input color="orange" outlined dense />
          </div>
          <div class=" q-ma-md">
            <label class="text-subtitle2">Phone Number<span class="text-red"> *</span></label>
            <q-input color="orange" outlined dense />
          </div>
          <div class="inputmsg q-ma-md">
            <label class="text-subtitle2">Message<span class="text-red"> *</span></label>
            <q-input color="orange" type="textarea" outlined dense />
          </div>
          <div class="text-right">
            <q-btn color="green" label="Submit" />
          </div>
        </div>
      </q-card>
    </div>
  </div>
</template>


<script>
export default {
  name: 'sectionContactus'
}
</script>
