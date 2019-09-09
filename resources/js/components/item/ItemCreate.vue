<template>
    <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="card">
                    <div class="card-header card-header-success">
                        <h4 class="card-title">Items Creator</h4>
                        <p class="card-category">Create Items Complete</p>
                    </div>
                    <div class="card-body">
                        <form>
                        <div class="modal-body">
                            <div class="form-group">
                                <input v-model="form.name" type="text" name="name" placeholder="Enter ItemName"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                <has-error :form="form" field="name"></has-error>
                            </div>

                            <div class="form-group">
                                <input v-model="form.price" type="text" name="price" placeholder="Enter Price"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('price') }">
                                <has-error :form="form" field="price"></has-error>
                            </div>

                            <div class="form-group">
                                <textarea v-model="form.description" name="description" id="description"
                                placeholder="Short Description for Items"
                                class="form-control" :class="{ 'is-invalid': form.errors.has('description') }"></textarea>
                                <has-error :form="form" field="description"></has-error>
                            </div>

                            <div class="form-group">
                                <select v-model="form.category_id"  id="category_id" class="form-control" 
                                :class="{ 'is-invalid': form.errors.has('category_id') }" placeholder="Selected Categories Types">
                                    <option :value="category.id" v-for="category in categories" :key="category.id">{{ category.name }}</option>
                                </select>
                                <has-error :form="form" field="category_id"></has-error>
                            </div>

                            <div class="col-sm-12">
                                <input type="file" name="photo" class="form-input" @change="updateItemPhoto">
                            </div>

                        </div>
                            <div class="modal-footer">
                                <router-link to="/item">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                </router-link>
                                    <button type="submit" class="btn btn-primary" @click.prevent="createItem">Insert New</button>
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
            form : new Form({
              id:'',
                name:'',
                description:'',
                photo:'',
                price:'',
                category_id:'',
          }),
          categories:{},
        }
    },
    created(){
        this.categoryLoad();
    },

    methods:{
        categoryLoad(){
            axios.get('/api/category')
            .then(res => {
                this.categories = res.data.data
            })
        },

        createItem(){
            this.form.post('/api/item')
            .then(res => {
                this.$router.push('/item');
                Fire.$emit('AfterCreate');

                Toast.fire({
                    type: 'success',
                    title: 'User Created is successfully'
                })
          }).catch();
        },

        updateItemPhoto(e){
            let file = e.target.files[0];
                let reader = new FileReader();

                if (file['size'] < 2111775) {
                    reader.onloadend = (file)=>{
                        // console.log('RESULT' , reader.result);
                        this.form.photo = reader.result;
                    }
                    reader.readAsDataURL(file);
                }else{
                    swal({
                        type: 'error!',
                        title: 'Oops ... ',
                        text: 'You are uploading file is a large file',
                    })
                }
        },
        updateClose(){

        }
    }
}
</script>