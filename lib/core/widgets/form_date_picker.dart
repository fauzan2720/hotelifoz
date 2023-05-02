part of 'package:hotelifoz/core.dart';

class FormDatePicker extends StatelessWidget {
  final String title;
  final Function(String value) onChanged;

  const FormDatePicker({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? pickedDate;
    String? dateFormatted;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FW.medium,
            color: context.color.textPrimary,
          ),
        ),
        8.0.height,
        StatefulBuilder(
          builder: (context, setState) => InkWell(
            onTap: () async {
              final result = await showDatePicker(
                context: context,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                initialDate: pickedDate ?? DateTime.now(),
                firstDate: DateTime.now().subtract(const Duration(days: 1)),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              pickedDate = result ?? DateTime.now();
              final DateFormat formatter = DateFormat('yyyy-MM-dd');
              dateFormatted = formatter.format(pickedDate!);
              setState(() {});
              onChanged(dateFormatted!);
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: AppColors.stroke),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateFormatted ?? "Pilih Tanggal",
                    style: TextStyle(
                        color: dateFormatted == null
                            ? AppColors.secondary
                            : context.color.textPrimary),
                  ),
                  const ImageIcon(
                    AppIcons.calendar,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
