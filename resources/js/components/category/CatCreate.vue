<template>
    <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Category Creator</h4>
                        <p class="card-category">Create Category Complete</p>
                    </div>
                    <div class="card-body">
                        <form @submit.prevent="createCategory">
                            <div class="modal-body">
                                <div class="form-group">
                                    <input v-model="form.name" type="text" name="name" placeholder="Enter Category"
                                    class="form-control mt-4" v-for="(form,index) in form" :key="index" required>
                                    <i class="fa fa-plus-square pull-right" style="font-size:20px;" @click="addForm"></i>
                                    <i class="fa fa-minus-square pull-right mr-4" style="font-size:20px;" @click="deleteInput()"></i>
                                </div>

                            </div>
                                <div class="modal-footer">
                                    <router-link to="/category">
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Back</button>
                                    </router-link>
                                <button type="submit" class="btn btn-primary">Create New</button>
                                </div>
                            </form>
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
            form:[{
                id:'',
                name:''
            }]
        }
    },
    created(){

    },

    methods:{
        createCategory(){
            axios.post('/api/category',{'form':this.form})
            .then(res=>{
                this.$router.push('/category');
                Toast.fire({
                    type: 'success',
                    title: 'Created in successfully'
                })
            })
        },

        addForm(){
            this.form.push({
                name:''
            })
        },
        deleteInput(){
            this.form.splice(this.form.length-1,1);
        }
    }
}
</script>