<template>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="card">
                        <div class="card-header card-header-info">
                            <h4 class="card-title">Edit Users</h4>
                            <p class="card-category">Complete your Users</p>
                        </div>
                        <div class="card-body">
                            <v-form @submit.prevent="update" class="blue-grey lighten-4 pa-4">
                                <v-text-field class="vinput" v-model="form.name" label="Student Name" type="text" required>
                                </v-text-field>

                                <v-text-field class="vinput" v-model="form.email" label="When Student Born ?" type="text" required>
                                </v-text-field>
                        
                                <v-text-field class="vinput" v-model="form.password" label="Where Student birthhome ? " type="text" required>
                                </v-text-field>
                        
                                <v-text-field class="vinput" v-model="form.type" label="Student Father Name" type="text" required>
                                </v-text-field>
                        
                                <v-textarea filled auto-grow label="Users BIOs" rows="4" row-height="30" shaped ></v-textarea>

                                <v-card-actions>
                                    <v-btn small type="submit" class="brown darken-1 mr-4"> Update </v-btn>
                                    <v-btn small > Cancel </v-btn>
                            </v-card-actions>

                            </v-form>
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
            form : {
              id:null,
              name:null,
              email:null,
              password: null,
              type:null,
              bio:null,
              photo:null,
          },

        }
    },
    created(){
        this.editUserGet();
    },

    methods:{
        editUserGet(){
            axios.get(`/api/user/${this.$route.params.id}`)
            .then(res=>{
                console.log(res);
                
                this.form=res.data
            })
        }
    },
}
</script>