part of 'package:hotelifoz/core.dart';

class FozFormInput extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? icon;
  final bool isBackPage;
  final bool autofocus;
  final void Function()? onTap;
  final void Function(String value)? onChanged;

  const FozFormInput({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType,
    this.validator,
    this.icon,
    this.isBackPage = false,
    this.autofocus = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        enabled: onTap != null ? false : true,
        autofocus: autofocus,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColors.stroke),
          ),
          labelStyle: const TextStyle(
            color: AppColors.primary,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.secondary),
          prefixIcon: isBackPage
              ? InkWell(
                  onTap: () => context.pop(),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondary,
                    ),
                  ),
                )
              : null,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: icon,
          ),
        ),
      ),
    );
  }
}
