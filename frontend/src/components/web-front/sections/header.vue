<template>
  <div class="row justify-between bg-white text-grey-8 q-px-lg container" style="height:90px">
    <div class="row items-center">
      <div @click="$router.push('/')">
        <q-img src="~/assets/logo.png" alt="Logo" class="logo" width="70px" />
      </div>
    </div>
    <div class="row col items-center justify-end q-gutter-md">


      <div>
        <q-btn no-caps flat unelevated to="/restaurants/" icon="restaurant" label="Restaurants"></q-btn>
      </div>
      <div>
        <q-btn no-caps flat unelevated to="/dishes/" icon="mdi-food" label="Dishes">
        </q-btn>
      </div>
      <div v-if="$store.state.app.frontendLogin">
        <q-btn-dropdown no-caps flat unelevated icon="person" label="My Account">
          <q-list>
            <q-item clickable v-close-popup @click="$router.push('/account/orders')">
              <q-item-section>
                <q-item-label>Orders</q-item-label>
              </q-item-section>
            </q-item>
            
            <q-item clickable v-close-popup @click="$router.push('/account/settings')">
              <q-item-section>
                <q-item-label>Settings</q-item-label>
              </q-item-section>
            </q-item>
            <q-item clickable v-close-popup @click="$store.commit('app/setFrontendLogout')">
              <q-item-section>
                <q-item-label>Logout</q-item-label>
              </q-item-section>
            </q-item>
          </q-list>
        </q-btn-dropdown>
      </div>
      <div v-if="!$store.state.app.frontendLogin">
        <q-btn no-caps flat unelevated icon="person" label="Login" @click="login.open = true">
        </q-btn>
      </div>
      <div>
        <q-btn no-caps flat unelevated to="/cart/" icon="shopping_cart" label="Cart">
          <q-badge floating color="red">{{ $store.state.app.cartItems.length }}</q-badge>
        </q-btn>
      </div>
      <q-dialog v-model="login.open" position="right" full-height>
        <q-card class="q-pa-lg" style="width:360px">
          <q-tab-panels v-model="loginSignupTab" animated>
            <q-tab-panel name="login">
              <login-form @done="login.open = false"></login-form>
              <div class="text-caption q-ma-md" style="font-size:14px"> New User? <q-btn flat color="primary"
                  @click="loginSignupTab = 'signup'">Signup</q-btn>
              </div>
            </q-tab-panel>
            <q-tab-panel name="signup">
              <signup-form></signup-form>
              <div class="text-caption q-ma-md" style="font-size:14px"> Already Registered? <q-btn flat color="primary"
                  @click="loginSignupTab = 'login'">Login</q-btn>
              </div>
            </q-tab-panel>
          </q-tab-panels>


        </q-card>
      </q-dialog>
    </div>
  </div>
</template>
<script>
import loginForm from 'components/web-front/login'
import signupForm from 'components/web-front/signup'
export default {
  name: 'sectionHeader',
  components: { loginForm, signupForm },
  data () {
    return {
      login: {
        open: false
      },
      loginSignupTab: 'login'
    }
  }

};
</script>
