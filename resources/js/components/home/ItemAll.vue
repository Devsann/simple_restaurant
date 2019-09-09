<template>
    <div class="content" >
      <div class="container" >
          <router-link :to="itemdata.path">
            <div class="card border-primary mb-3" style="max-width: 20rem;">
                <img class="card-img-top item_img" :src="`/img/item/${itemdata.image}`" alt="Card image cap">
                <div class="card-body text-primary p_body">
                    <p class="card-text p_text1">$ {{ itemdata.price }}</p>
                </div>
            </div>
          </router-link>
      </div>
    </div>
</template>

<script>
   export default {
       props:[
           'itemdata'
       ],

     data(){
       return{

       }
     },
     created(){
         
     },

     methods:{

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
  height: 230px;
}

</style>
