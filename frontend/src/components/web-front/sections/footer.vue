<template>
  <div class="footer">
    <div class="container">
      <div class="row">
        <div class="footer-col">
          <h4>Company</h4>
          <ul>
            <li><a href="#">about us</a></li>
            <li><a href="#">our services</a></li>
            <li><a href="#">privacy policy</a></li>
            <li><a href="#">affiliate program</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Get help</h4>
          <ul>
            <li><a href="#">contact us</a></li>
            <li><a href="#">partnership</a></li>
            <li><a href="#">quality and processes</a></li>
            <li><a href="#">Leadership Team</a></li>
            <li><a href="#">payment options</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Services</h4>
          <ul>
            <li><a href="#">Professional Services</a></li>
            <li><a href="#">Cloud services</a></li>
            <li><a href="#">Digital analytics and Ai</a></li>
            <li><a href="#">Digital marketing</a></li>
          </ul>
        </div>
        <div class="footer-col">
          <h4>Follow us</h4>
          <div class="social-links">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
.footer {
  margin-top: 50px;

}

.container {
  max-width: 1170px;
  margin: auto;
}

.row {
  display: flex;
  flex-wrap: wrap;
}

ul {
  list-style: none;
}

.footer {
  background: linear-gradient(rgba(0, 0, 0, 0.836), #270e0adc), url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80') 50% 0 repeat-y fixed;
  -webkit-background-size: cover;
  background-size: cover;
  background-position: center;
  padding: 70px 0;
  margin-top: 50;
}

.footer-col {
  width: 25%;
  padding: 0 15px;

}

.footer-col h4 {
  font-size: 18px;
  color: #ffffff;
  text-transform: capitalize;
  margin-bottom: 35px;
  font-weight: 500;
  position: relative;
  padding-left: 2rem;
}

.footer-col h4::before {
  content: '';
  position: absolute;
  left: 0;
  bottom: -3px;
  background-color: #e7140d;
  height: 2px;
  box-sizing: border-box;
  width: 70px;
  padding-left: 10rem;
}

.footer-col ul li:not(:last-child) {
  margin-bottom: 10px;
}

.footer-col ul li a {
  font-size: 16px;
  text-transform: capitalize;
  color: #ffffff;
  text-decoration: none;
  font-weight: 300;
  color: #bbbbbb;
  display: block;
  transition: all 0.3s ease;
}

.footer-col ul li a:hover {
  color: #ffffff;
  padding-left: 8px;
}

.footer-col .social-links a {
  display: inline-block;
  height: 40px;
  width: 40px;
  background-color: rgba(255, 255, 255, 0.2);
  margin: 0 10px 10px 0;
  text-align: center;
  line-height: 40px;
  border-radius: 50%;
  color: #ffffff;
  transition: all 0.5s ease;
}

.footer-col .social-links a:hover {
  color: #24262b;
  background-color: #ffffff;
}
</style>
<script>
export default {
  name: 'sectionFooter',
  props: [
    'name',
    'title',
  ]
}
</script>
