<template>
<router-link :to="itemdata.path">
    <div class="card border-primary mb-3 overlay" style="max-width: 20rem;">
        <div class="card-body text-primary">
            <p class="card-text p_text1">$ {{ itemdata.description }}</p>
        </div>
    </div>
</router-link>
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
    computed:{

    },

    created(){

    },
    methods:{
    }
}
</script>

<style scoped>
.overlay {
  position: absolute;
  bottom: 30px;
  left: 30px;
  right: 0;
  background-color: rgba(139, 195, 74, 0.56);
  overflow: hidden;
  width: 100%;
  height: 0;
  transition: .4s ease;
}

.container:hover .overlay {
  height: 270px;
}
</style>
