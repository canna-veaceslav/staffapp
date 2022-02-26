package com.staffapp.mobile.activities;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.Fragment;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.MenuItem;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationView;
import com.staffapp.mobile.R;
import com.staffapp.mobile.api.RetrofitClient;
import com.staffapp.mobile.fragment.CheckFragment;
import com.staffapp.mobile.fragment.LinkFragment;
import com.staffapp.mobile.fragment.SettingsFragment;
import com.staffapp.mobile.fragment.UnlinkFragment;
import com.staffapp.mobile.model.CustomResponse;
import com.staffapp.mobile.model.User;
import com.staffapp.mobile.storage.SharedPrefManager;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CheckActivity extends AppCompatActivity implements BottomNavigationView.OnNavigationItemSelectedListener {
    private static final String TAG = "CheckActivity";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_check);

        BottomNavigationView navigationView = findViewById(R.id.botton_nav);
        navigationView.setOnNavigationItemSelectedListener(this);

        displayFragment(new CheckFragment());

        Call<CustomResponse> call = RetrofitClient
                .getInstance()
                .getApi()
                .getAllEmployees();
        call.enqueue(new Callback<CustomResponse>() {

                         @Override
                         public void onResponse(Call<CustomResponse> call, Response<CustomResponse> response) {
                             CustomResponse customResponse = response.body();
                             String msg = customResponse.getMessage();
                             String status = customResponse.getStatus();
                             String timestamp = customResponse.getTimeStamp();
                             List<?> employeeList = (List<?>) customResponse.getData().get("employees");
                             System.out.println(msg + " | " + status + "  | " + timestamp);
                             assert employeeList != null;
                             System.out.println("[itemList  SIZE ]" + employeeList.size());
                             Log.i(TAG, employeeList + "List with items retrieved");
                             Toast.makeText(CheckActivity.this, customResponse.getMessage(), Toast.LENGTH_LONG).show();
                         }

                         @Override
                         public void onFailure(Call<CustomResponse> call, Throwable t) {

                             }
                         });
//        User user = SharedPrefManager.getInstance(this).getUser();


    }

    private void displayFragment(Fragment fragment) {
        getSupportFragmentManager()
                .beginTransaction()
                .replace(R.id.container_check, fragment)
                .commit();

    }

    @Override
    protected void onStart() {
        super.onStart();

        if (!SharedPrefManager.getInstance(this).isLoggedIn()) {
            Intent intent = new Intent(this, LoginActivity.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(intent);
        }

    }


    @Override
    public boolean onNavigationItemSelected(@NonNull MenuItem item) {

        Fragment fragment = null;
        switch (item.getItemId()) {
            case R.id.menu_checking:
                fragment = new CheckFragment();
                break;
            case R.id.menu_link:
                fragment = new LinkFragment();
                break;
            case R.id.menu_unlink:
                fragment = new UnlinkFragment();
                break;
            case R.id.menu_settings:
                fragment = new SettingsFragment();
                break;
        }
        if (fragment != null) {
            displayFragment(fragment);
        }

        return false;

    }
}