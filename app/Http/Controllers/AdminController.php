<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Transaction;
use App\AdminNotifications;
use App\UserNotifications;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $now = Carbon::now();
        $allTransactions = Transaction::where('status', 'success')->get();
        $allSales = Transaction::where('status', 'success')->count();
        $monthlySales = Transaction::where('status', 'success')->whereMonth('created_at', $now->month)->count();
        $annualSales = Transaction::where('status', 'success')->whereYear('created_at', $now->year)->count();
        $monthlyTransactions = Transaction::where('status', 'success')->whereMonth('created_at', $now->month)->get();
        $annualTranscations = Transaction::where('status', 'success')->whereYear('created_at', $now->year)->get();
        
        $incomeTotal = 0;
        $incomeMonthly = 0;
        $incomeAnnual = 0;

        foreach ($allTransactions as $transaction) {
            $incomeTotal+=$transaction->total;
        }

        
        foreach ($monthlyTransactions as $monthly) {
            $incomeMonthly+=$monthly->total;
        }

        foreach ($annualTranscations as $annual) {
            $incomeAnnual+=$annual->total;
        }

        $january = Transaction::where('status', 'success')->whereMonth('created_at', '01')->count();
        $february = Transaction::where('status', 'success')->whereMonth('created_at', '02')->count();
        $march = Transaction::where('status', 'success')->whereMonth('created_at', '03')->count();
        $april = Transaction::where('status', 'success')->whereMonth('created_at', '04')->count();
        $may = Transaction::where('status', 'success')->whereMonth('created_at', '05')->count();
        $june = Transaction::where('status', 'success')->whereMonth('created_at', '06')->count();
        $july = Transaction::where('status', 'success')->whereMonth('created_at', '07')->count();
        $august = Transaction::where('status', 'success')->whereMonth('created_at', '08')->count();
        $september = Transaction::where('status', 'success')->whereMonth('created_at', '09')->count();
        $october = Transaction::where('status', 'success')->whereMonth('created_at', '10')->count();
        $november = Transaction::where('status', 'success')->whereMonth('created_at', '11')->count();
        $december = Transaction::where('status', 'success')->whereMonth('created_at', '12')->count();

        return view('admin.admindashboard', compact('now', 'allSales', 'monthlySales', 'annualSales', 'incomeTotal', 'incomeMonthly', 'incomeAnnual', 'january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'));
    }

    public function adminNotif($id) 
    {
        $notification = AdminNotifications::find($id);
        $notif = json_decode($notification->data);
        $date = Carbon::now('Asia/Makassar');
        AdminNotifications::where('id', $id)
                ->update([
                    'read_at' => $date
                ]);
        
        if ($notif->category == 'transaction') {
            return redirect()->route('transactions.detail', $notif->id);
        } elseif ($notif->category == 'review') {
            return redirect('/products');
        } 
    }
}
