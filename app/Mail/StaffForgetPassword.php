<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class StaffForgetPassword extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    protected $admin;
    protected $template;
    public $subject;
    public function __construct($admin,$template,$subject)
    {
        $this->admin=$admin;
        $this->subject=$subject;
        $this->template=$template;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $template=$this->template;
        $admin=$this->admin;
        return $this->subject($this->subject)->view('staff.auth.send-forget-token',compact('admin','template'));
    }
}
