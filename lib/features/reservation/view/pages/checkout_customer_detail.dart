import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelifoz/core.dart';
import 'package:hotelifoz/features/home/model/models/hotel_model.dart';
import 'package:hotelifoz/features/launch/model/models/user_model.dart';
import 'package:hotelifoz/features/reservation/model/models/selecting_customer_status.dart';
import 'package:hotelifoz/features/reservation/view/pages/checkout_payment.dart';
import 'package:hotelifoz/features/reservation/view/widgets/scaffold_checkout_info.dart';

class CheckoutCustomerDetail extends StatelessWidget {
  final HotelModel hotel;

  const CheckoutCustomerDetail({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final UserModel userLogin = context.read<AuthCubit>().user!;
    final TextEditingController nameController =
        TextEditingController(text: userLogin.name);
    final TextEditingController phoneController =
        TextEditingController(text: userLogin.phoneNumber);
    final TextEditingController emailController =
        TextEditingController(text: userLogin.email);

    final List<SelectingCustomerStatus> customerStatus = [
      SelectingCustomerStatus(index: 0, status: "Tuan"),
      SelectingCustomerStatus(index: 1, status: "Nyonya"),
      SelectingCustomerStatus(index: 2, status: "Nona"),
    ];
    int customerStatusIndex = 0;

    return ScaffoldCheckoutInfo(
      hotel: hotel,
      title: "Detail Pemesan",
      onNextTap: (state) {
        if (formKey.currentState!.validate()) {
          if (state > 0) {
            context.push(CheckoutPayment(
              hotel: hotel,
              customerStatus: customerStatus[customerStatusIndex].status,
              customerName: nameController.text,
              customerPhone: phoneController.text,
              customerEmail: emailController.text,
            ));
          } else {
            "Pastikan data terisi dengan benar".infoBar(context);
          }
        }
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.0.height,
              StatefulBuilder(
                builder: (context, setState) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: customerStatus
                      .map((e) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: customerStatusIndex == e.index
                                  ? AppColors.primary
                                  : AppColors.white,
                            ),
                            onPressed: () =>
                                setState(() => customerStatusIndex = e.index),
                            child: Text(
                              e.status,
                              style: TextStyle(
                                color: customerStatusIndex == e.index
                                    ? AppColors.white
                                    : AppColors.primary,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              20.0.height,
              FozFormInput(
                controller: nameController,
                hint: "Nama Lengkap",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Inputan wajib diisi';
                  } else {
                    return null;
                  }
                },
              ),
              10.0.height,
              FozFormInput(
                controller: phoneController,
                hint: "(62) Nomor Telepon",
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Inputan wajib diisi';
                  } else if (value.isValidPhoneNumber()) {
                    return 'Nomor telepon harus berawalan 62';
                  } else {
                    return null;
                  }
                },
              ),
              10.0.height,
              FozFormInput(
                controller: emailController,
                hint: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Inputan wajib diisi';
                  } else if (value.isValidEmail()) {
                    return 'Email harus valid';
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
      ).animate().scale(),
    );
  }
}
