<template>
    <div class="content">
      <div class="container">
          <button class="btn btn-primary badge_button" data-toggle="modal" data-target="#cart">
                <i class="fa fa-shopping-cart"></i> <span class="badge badge-light">{{badge}}</span>
          </button>
          <div class="modal" id="cart">
              <div class="modal-dialog modal-dialog-centered modal-lg">
                  <div class="modal-content">
                      <div class="modal-header">
                          <h5 class="modal-title">Your Cart</h5>
                          <button class="close" data-dismiss="modal">&times;</button>
                      </div>
                      <div class="modal-body">
                          <table class="table table-striped text-left">
                              <tbody>
                                  <tr v-for="(cart, n) in carts" v-bind:key="cart.id">
                                      <td>
                                        <img class="img-circle user_img" alt="Item Avatar" :src="`/img/item/${cart.image}`">
                                      </td>
                                      <td>{{ cart.name }}</td>
                                      <td>Rp. {{ cart.price }}</td>
                                      <td width="60">
                                          <button @click="removeCart(n)" class="btn btn-danger btn-sm"><i class="fa fa-close"></i></button>
                                      </td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                      <div class="modal-footer">
                          Total Price: Rp. {{totalprice}} &nbsp;
                          <a href="/api/checkout" class="btn btn-primary">Checkout</a>
                      </div>
                  </div>
              </div>
          </div>

        <div class="row justify-content-md-center">
              <div class="col-lg-4 item_data" v-for="(item,index) in itemAlls" :key="item.path" @mousemove="mouseMove = index">
                <ItemAll :itemdata=item ></ItemAll>
                  <ItemList :itemdata=item v-show="mouseMove == index"></ItemList>
              </div>
        </div>
      </div>
    </div>
</template>

<script>
import ItemAll from './ItemAll.vue'
import ItemList from './ItemList.vue'

   export default {
     components:{
       ItemAll,
       ItemList
     },

     data(){
       return{
         itemAlls:{},
         mouseMove:-1,
         available:true,

         carts:[],
           cartadd:{
             id:'',
             name:'',
             price:'',
             description:'',
             image:'',
             date:''
           },
           badge:'0',
           quantity:'1',
           totalprice:'0',
       }
     },
     created(){
       this.itemAll();
       Fire.$on('listenAddCart',(pro)=>{
         this.addCart(pro)
       });
       this.viewCart()
     },

     methods:{
       itemAll(){
         axios.get('/api/item')
         .then(res => {
           this.itemAlls = res.data.data
           
         })
       },

       viewCart(){
           if (localStorage.getItem('carts')) {
             this.carts = JSON.parse(localStorage.getItem('carts'));
             this.badge = this.carts.length;
             this.totalprice = this.carts.reduce((total,item)=>{
               return total + this.quantity*item.price;
             }, 0);
           }
         },

         addCart(pro){
           this.cartadd.id = pro.id;
           this.cartadd.name = pro.name;
           this.cartadd.price = pro.price;
           this.cartadd.description = pro.description;
           this.cartadd.image = pro.image;
           this.cartadd.date = pro.date;
           this.carts.push(this.cartadd);
           this.cartadd = {};
           this.storeCart();
         },

         removeCart(pro){
           this.carts.splice(pro, 1);
           this.storeCart();
         },
         
         storeCart(){
           let parsed = JSON.stringify(this.carts);
           localStorage.setItem('carts',parsed);
           this.viewCart();
         }
     },

     mounted(){
     }
    }
</script>
<style scoped>
.user_img{
    height: 80px;
    width: 120px;
}
.badge_button{
  margin-left: 12px;
}
</style>
