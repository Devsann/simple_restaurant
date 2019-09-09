<template>
    <div class="content" >
      <div class="container" >
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
              <div class="col-lg-6" >
                  <img class="card-img-top item_img" :src="`/img/item/${itemLists.image}`" alt="Card image cap">
              </div>
              <div class="col-lg-6">
                <div class="card-body text-primary p_body item_img">
                  <p class="card-text p_text1">{{ itemLists.description }}</p>
                  <div class="col text-center">
                    <router-link to="/">
                      <button class="btn btn-danger text-center">Back</button>
                    </router-link>

                    <button href="" class="btn btn-primary text-center" @click="addCart(itemLists)">Add Carts
                      <i class="material-icons" style="font-size:25px;color:white">shop</i>
                    </button>
                  </div>
                </div>
              </div>

            </div>
      </div>
    </div> 
</template>

<script>
   export default {
     data(){
       return{
           itemLists:{},
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
         this.getItemList();
         this.viewCart();
     },

     methods:{
         getItemList(){
             axios.get(`/api/item/${this.$route.params.slug}`)
             .then(res => {
               this.itemLists = res.data.data
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
           Fire.$emit('listenAddCart',pro);
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
.p_text1{
  text-align: center;
  color: white;
  font-weight: bolder;
}
.p_body{
  background:#8bc34a;;
}
.item_img{
  height: 100%;
}
.user_img{
    height: 80px;
    width: 120px;
}
.badge_button{
  margin-left: 1px;
}
</style>
