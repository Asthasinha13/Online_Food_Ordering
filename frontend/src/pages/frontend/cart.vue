<template>
  <q-page class="fit row justify-center bg-grey-3 q-py-lg">
    <div v-if="$store.state.app.cartItems.length === 0" class="row container items-center justify-center">
      <h3>Your Cart is Empty</h3>
    </div>
    <div v-else class="row justify-around" style="width:1120px">

      <div class="col-12 col-md-7 q-gutter-md">

        <q-card class="column q-pa-lg" flat>
          <div v-if="deliveryAddress === null">
            <div>
              <h5>Choose a delivery address</h5>
            </div>
            <div class="row">
              <q-card flat bordered class="q-ma-md q-pa-md text-grey-8" v-for="address, index of deliveryAddresses"
                :key="index" style="width:250px" @click="deliveryAddress = address">
                <div class="column">
                  <div class="q-py-sm">
                    <q-icon name="home" size="md" />{{ address.address_type }}
                  </div>
                  <div>
                    {{ address.address }}
                  </div>
                  <div class="text-bold q-my-md">
                    {{ Math.round(Math.random() * 100) }} MINS
                  </div>
                  <div>
                    <q-btn color="green" unelevated label="Deliver Here" />
                  </div>
                </div>

              </q-card>
            </div>
          </div>
          <div v-else @click="deliveryAddress = null">
            <div class="row items-center">
              <h5 class="q-ma-none q-my-md">Delivery Address</h5>
              <q-avatar class="q-mx-sm" color="green" text-color="white" icon="check" size="xs">
              </q-avatar>
            </div>
            <div class="text-grey-8 text-bold ">
              {{ deliveryAddress.address_type }}
            </div>
            <div class="row">
              {{ deliveryAddress.address }}
            </div>

          </div>
        </q-card>
        <q-card class="column q-pa-lg" flat>
          <div v-if="deliveryAddress !== null">
            <h5>Choose Payment Method</h5>
            <q-card flat class="fit row" bordered>
              <div class="bg-blue-grey-2" style="width:200px">
                <q-list separator>
                  <q-item :class="{ 'bg-white': paymentTab === 'cod' }" clickable v-ripple @click="paymentTab = 'cod'">
                    <q-item-section class="q-py-lg" avatar>
                      <q-avatar icon="currency_rupee"></q-avatar>
                    </q-item-section>
                    <q-item-section>
                      <q-item-label>COD</q-item-label>
                    </q-item-section>
                  </q-item>
                  <q-item :class="{ 'bg-white': paymentTab === 'upi' }" clickable v-ripple @click="paymentTab = 'upi'">
                    <q-item-section class="q-py-lg" avatar>
                      <q-avatar icon="phone_android"></q-avatar>
                    </q-item-section>
                    <q-item-section>
                      <q-item-label>UPI</q-item-label>
                    </q-item-section>
                  </q-item>
                  <q-item :class="{ 'bg-white': paymentTab === 'net-banking' }" clickable v-ripple
                    @click="paymentTab = 'card'">
                    <q-item-section class="q-py-lg" avatar>
                      <q-avatar icon="credit_card"></q-avatar>
                    </q-item-section>
                    <q-item-section>
                      <q-item-label>Credit/Debit Card</q-item-label>
                    </q-item-section>
                  </q-item>
                  <q-item :class="{ 'bg-white': paymentTab === 'net-banking' }" clickable v-ripple
                    @click="paymentTab = 'net-banking'">
                    <q-item-section class="q-py-lg" avatar>
                      <q-avatar icon="account_balance"></q-avatar>
                    </q-item-section>
                    <q-item-section>
                      <q-item-label>Net Banking</q-item-label>
                    </q-item-section>
                  </q-item>
                </q-list>
              </div>
              <div class="col q-pa-lg scroll">
                <q-tab-panels v-model="paymentTab">
                  <q-tab-panel name="cod">
                    <q-btn label="Pay on Delivery (COD)" unelevated color="primary" @click="createOrder" />
                  </q-tab-panel>
                  <q-tab-panel name="upi">
                    upi
                  </q-tab-panel>
                  <q-tab-panel name="card">
                    CARD
                  </q-tab-panel>
                  <q-tab-panel name="net-banking">
                    net banking
                  </q-tab-panel>
                </q-tab-panels>

              </div>
            </q-card>
          </div>
          <div v-else>
            <h5>Payment</h5>
          </div>
        </q-card>

      </div>
      <q-card flat class="column q-pa-md">
        <q-card>
          <div class="row q-pa-md">
            <div class="bg-grey">
              <q-img width="50px" height="50px"></q-img>
            </div>
            <div class="col q-px-sm">
              <div class="text-bold">
                {{ $store.state.app.cartItems[0].restaurant_name }}
              </div>
              <div class="text-grey-6">
                {{ $store.state.app.cartItems[0].address }}
              </div>

            </div>

          </div>
        </q-card>
        <q-list dense separator>
          <q-item v-for="item, index of $store.state.app.cartItems" :key="index">
            <q-item-section>
              <div class="row items-center">
                <div class="q-pa-sm" style="width:20px">
                  <q-icon :color="'red'" name="circle"></q-icon>
                </div>
                <div class="col q-pa-sm">
                  <div class="ellipsis" style="max-width:200px"> {{ item.item_name }}</div>
                </div>
                <div class="q-pa-sm" style="width:115px">
                  <q-btn-group outline class=" q-mx-md" color="green">
                    <q-btn unelevated dense color="green" outline
                      @click="$store.commit('app/decreaseQuantity', { id: item.id })"
                      :icon="item.quantity === 1 ? 'delete' : 'remove'">
                    </q-btn>
                    <q-btn unelevated dense outline color="green">{{ item.quantity }}</q-btn>
                    <q-btn unelevated dense outline color="green"
                      @click="$store.commit('app/increaseQuantity', { id: item.id })" icon="add">
                    </q-btn>
                  </q-btn-group>
                </div>
                <div style="width:50px">
                  Rs. {{ item.price * item.quantity }}
                </div>
              </div>
            </q-item-section>
          </q-item>
        </q-list>
        <div class="column q-my-md q-gutter-sm text-grey-7">
          <div class="text-grey-9 text-bold">
            Bill Details
          </div>
          <div class="row justify-between">
            <div>
              Item Total
            </div>
            <div class="rupee">
              {{ $store.getters['app/cartTotal'] }}
            </div>
          </div>
          <div class="row justify-between">
            <div>
              Delivery Fee
            </div>
            <div class="rupee">
              {{ deliveryCharges }}
            </div>
          </div>
          <div class="row justify-between">
            <div>
              Taxes & Charges
            </div>
            <div class="rupee">
              {{ taxes }}
            </div>
          </div>
          <q-separator />
          <div class="row justify-between text-bold text-grey-9">
            <div>
              TO PAY
            </div>
            <div class="rupee">
              {{ grandTotal }}
            </div>
          </div>
        </div>

      </q-card>

    </div>
  </q-page>
</template>
<script>
import router from 'src/router'

export default {
  name: 'pageCart',
  data () {
    return {
      paymentTab: 'cod',
      deliveryAddress: null,
      deliveryCharges: 0,
      deliveryAddresses: []
    }
  },
  watch: {
    '$store.state.app.frontendUser': {
      handler (val) {
        console.log(val)
        if (val?.id !== undefined) {
          this.fetchDeliveryAddresses()
        }
      },
      immediate: true
    }
  },
  computed: {
    taxes () {
      return Math.round((this.$store.getters['app/cartTotal'] + this.deliveryCharges) * 0.18, 2)
    },
    grandTotal () {
      return Math.round(this.$store.getters['app/cartTotal'] + this.deliveryCharges + this.taxes)
    },
    orderDetail () {
      let orderDetail = {}
      orderDetail.customer_id = this.$store.state.app.frontendUser?.id
      console.log(this.$store.state.app.cartItems)
      orderDetail.restaurant_id = this.$store.state.app.cartItems[0].restaurant_id
      orderDetail.orderDetails = this.$store.state.app.cartItems.map((item) => {
        return {
          menu_id: item.id,
          quantity: item.quantity,
          price: item.price,
          total_amount: item.price * item.quantity,
          unit: item.unit
        }
      })
      orderDetail.billed_amount = this.$store.getters['app/cartTotal']
      orderDetail.taxes = this.taxes
      orderDetail.grand_total = this.grandTotal
      return orderDetail
    }
  },
  methods: {
    fetchDeliveryAddresses () {
      this.$api.get('/api/customer-addresses?customer_id=' + this.$store.state.app.frontendUser.id).then((response) => {
        this.deliveryAddresses = response.data
      })
    },
    createOrder () {
      this.$api.post('/api/orders/createOrder', { formData: this.orderDetail }).then((response) => {
        this.$store.commit('app/emptyCart')
        this.$router.push('/cart/success')
      })
    }
  },
  created () {
    this.deliveryCharges = Math.floor(Math.random() * 100)
  }
}
</script>