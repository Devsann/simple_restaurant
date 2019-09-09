<template>
    <div class="content" >
      <div class="container-fluid" v-if="$gate.isAdmin()">
        <div class="row" v-if="itemList">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Items List Tables</h4>
                      <router-link to="/item/create">
                      <a href="" class="btn btn-success btn-sm pull-right">Add New
                      <i class="material-icons" style="font-size:25px;color:white">person_add</i>
                      </a>
                    </router-link>
                  <p class="card-category"> Here is a Items name for this table</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>NO.</th>
                        <th> Image </th>
                        <th> Name </th>
                        <th> Description</th>
                        <th>Price</th>
                        <th> Category Name </th>
                        <th> Created Date</th>
                        <th> Actions</th>
                      </thead>
                      <tbody>
                        <tr v-for="(item,index) in items" :key="item.id">
                          <td>{{ index+1 }}</td>
                          <td>
                            <img class="img-circle user_img" alt="Item Avatar" :src="`/img/item/${item.image}`">
                          </td>
                          <td>{{ item.name }}</td>
                          <td>{{ item.description}}</td>
                          <td>{{ item.price }}</td>
                          <td>{{ item.catName}}</td>
                          <td>{{ item.created_at}}</td>
                          <td class="text-primary" >
                              <a href="#" @click="editItem(index)">
                                  <i class="material-icons" style="color:orange">create</i>
                              </a>/
                              <a href="#" @click="deleteItem(item.id)">
                                  <i class="material-icons" style="color:red">delete_sweep</i>
                              </a>
                          </td>
                          </tr>
                          <tr>
                          <td></td>
                          <td> </td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td class="text-primary"> </td>
                        </tr>                     
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row" v-if="itemEditForm">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-info">
                    <h4 class="card-title">Edit Item</h4>
                    <p class="card-category">Complete your Items</p>
                </div>
                <div class="card-body">
                  <form @submit.prevent="updateItem">
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
                                <button type="button" class="btn btn-danger" data-dismiss="modal" @click="editClose">Cancel</button>
                                <button type="submit" class="btn btn-primary">Insert New</button>
                          </div>
                      </form>
                  </div>
              </div>
            </div>
          </div>

      </div>
      <div v-if="!$gate.isAdmin()">
        <not-found></not-found>
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
           price:'',
           photo:'',
           category_id:'',
         }),
        //  editForm:{
        //    id:'',
        //    name:'',
        //    description:'',
        //    price:'',
        //    photo:'',
        //    category_id:'',
        //  },
         items:{},
         categories:{},
         itemList:true,
         itemEditForm:false,
       }
     },

     created(){
       this.loadItem();
       this.loadCategory();
       Fire.$on('AfterCreate',()=>{
         this.loadItem();
       });
     },

     methods:{
       loadItem(){
         axios.get('/api/item')
         .then(res=>{
           this.items=res.data.data;
         })
       },
       loadCategory(){
         axios.get('/api/category')
         .then(res => {
           this.categories = res.data.data;
         })
       },

       updateItem(){
         axios.patch(`/api/item/${this.form.id}`,this.form)
         .then(res=>{
           console.log(res);
           
           Fire.$emit('AfterCreate');
            this.itemList=true;
            this.itemEditForm = false;
            Toast.fire({
                    type: 'warning',
                    title: 'Updated in successfully'
            })
         })
       },

       editItem(index){
         this.itemList=false;
         this.itemEditForm = true;
         this.form.id = this.items[index].id;
         this.form.name = this.items[index].name;
         this.form.description = this.items[index].description;
         this.form.price = this.items[index].price;
         this.form.photo = this.items[index].photo;
       },

       deleteItem(id){
         swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {

                        if (result.value) {
                            axios.delete('/api/item/'+id).then(() =>{
                                
                                    swal.fire(
                                    'Deleted!',
                                    'Your file has been deleted.',
                                    'success'
                                    )
                                    Fire.$emit('AfterCreate');
                            }).catch(() =>{
                                swal.fire(
                                    'error!',
                                    'You are Not Admin .. NoDeleted Sir !!',
                                    'warning'
                                )
                            });

                        }
                })
       },

       editClose(){
         this.itemList = true;
         this.itemEditForm = false;
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
     }
    }
</script>
<style scoped>
.user_img{
    height: 80px;
    width: 120px;
}
</style>
