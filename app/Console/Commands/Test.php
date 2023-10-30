<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class Test extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'update:mobile';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update User Mobile Number';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $userUser = \DB::table('users')
        ->where('id', 55)  // optional - to ensure only one record is updated.
        ->update([
            'phone'=>time()]);
       if ($userUser) {
            echo "Update Successfully";
        }else{
            echo "Not Update";
        }
    }
}
