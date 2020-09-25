<?php

namespace App\Policies;

use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

use App\Disc;

class DiscPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function add(User $user){

        foreach ($user->roles as $role) {
            if($role->name =='Guest' || $role->name =='Admin' ){
                return TRUE;
            }
        }

        return FALSE;
    }

     public function update(User $user, Disc $disc){

         foreach ($user->roles as $role) {
            if($role->name =='Admin'){
                //if($user->id == $disc->user_id){
                    return TRUE;
               // }
                
            }
        }
        return FALSE;
    }

    public function delete(User $user){

        foreach ($user->roles as $role) {
            if($role->name =='Admin'){
                return TRUE;
            }
        }

        return FALSE;
    }

}
