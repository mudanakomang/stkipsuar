<?php

use Illuminate\Database\Seeder;
use \App\Role;
use \App\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin=new Role();
        $admin->name='admin';
        $admin->display_name='Web Admin';
        $admin->description='';
        $admin->save();

        $dosen=new Role();
        $dosen->name='dosen';
        $dosen->display_name='Dosen STKIP Suar Bangli';
        $dosen->description='';
        $dosen->save();

        $admin1=new User();
        $admin1->name='Admin STKIP Suar Bangli';
        $admin1->username='admin';
        $admin1->email='admin@stkip-suarbangli.ac.id';
        $admin1->password=bcrypt('admin123');
        $admin1->save();
        $admin1->attachRole($admin);


    }
}
