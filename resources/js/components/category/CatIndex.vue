<template>
    <div class="content" >
      <div class="container-fluid" v-if="$gate.isAdmin()">
        <div class="row" v-if="categoryList">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Categorys List Tables</h4>
                      <router-link to="/category/create">
                      <a href="" class="btn btn-success btn-sm pull-right">Add New
                      <i class="material-icons" style="font-size:25px;color:white">person_add</i>
                      </a>
                    </router-link>
                  <p class="card-category"> Here is a Category name for this table</p>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th> ID </th>
                        <th> Name </th>
                        <th> Category Slug</th>
                        <th>Created At</th>
                        <th> Actions </th>
                      </thead>
                      <tbody>
                        <tr v-for="(category,index) in categories" :key="category.id">
                          <td>{{ index+1}}</td>
                          <td>{{ category.name }}</td>
                          <td> {{ category.catSlug }} </td>
                          <td> {{ category.created_at }} </td>
                          <td class="text-primary" >
                              <a href="#" @click="editCat(index)">
                                  <i class="material-icons" style="color:orange">create</i>
                              </a>/
                              <a href="#" @click="deleteCat(category.id)">
                                  <i class="material-icons" style="color:red">delete_sweep</i>
                              </a>
                          </td>
                        </tr>
                        <tr>
                          <td></td>
                          <td> </td>
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

          <div class="row" v-if="categoryEditForm">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-info">
                    <h4 class="card-title">Edit Category</h4>
                    <p class="card-category">Complete your Categories</p>
                </div>
                <div class="card-body">
                  <form @submit.prevent="updateCategory">
                    <div class="modal-body">
                        <div class="form-group">
                            <input v-model="editForm.name" type="text" name="name" placeholder="Enter Category"
                            class="form-control">
                        </div>

                    </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-danger" data-dismiss="modal" @click="editClose">Cancel</button>
                          <button type="submit" class="btn btn-primary">Update Now</button>
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
         editForm:{
           id:'',
           name:'',
           catSlug:''
         },
         categories:{},
         categoryList:true,
         categoryEditForm:false,
       }
     },

     created(){
       this.loadCat();
       Fire.$on('AfterCreate',()=>{
         this.loadCat();
       });
     },

     methods:{
       loadCat(){
         axios.get('/api/category')
         .then(res=>{
           this.categories=res.data.data;
         })
       },

       updateCategory(){
         axios.put(`/api/category/${this.editForm.catSlug}`,this.editForm)
         .then(res=>{
           Fire.$emit('AfterCreate');
            this.categoryList=true;
            this.categoryEditForm = false;
            Toast.fire({
                    type: 'warning',
                    title: 'Updated in successfully'
            })
         })
       },

       editCat(index){
         this.categoryList=false;
         this.categoryEditForm = true;
         this.editForm.id = this.categories[index].id;
         this.editForm.name = this.categories[index].name;
         this.editForm.catSlug = this.categories[index].catSlug;
       },

       deleteCat(id){
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
                            axios.delete('/api/category/'+id).then(() =>{
                                
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
         this.categoryList = true;
         this.categoryEditForm = false;
       }
     }
    }
</script>
