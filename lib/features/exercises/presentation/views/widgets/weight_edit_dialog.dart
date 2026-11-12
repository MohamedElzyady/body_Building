import 'package:body_buliding/core/utils/app_colors.dart';
import 'package:body_buliding/features/exercises/view_model/cubit/weight_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Dialog that lets the user enter or update the last weight for an exercise.
/// Validates that the input is a positive number, then saves via [WeightCubit].
class WeightEditDialog extends StatefulWidget {
  final String exerciseName;
  final double? currentWeight;

  const WeightEditDialog({
    super.key,
    required this.exerciseName,
    required this.currentWeight,
  });

  @override
  State<WeightEditDialog> createState() => _WeightEditDialogState();
}

class _WeightEditDialogState extends State<WeightEditDialog> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.currentWeight != null
          ? widget.currentWeight!.toStringAsFixed(
              widget.currentWeight! % 1 == 0 ? 0 : 1,
            )
          : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final value = double.parse(_controller.text.trim());
    context.read<WeightCubit>().setWeight(widget.exerciseName, value);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.cardBg,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actionsOverflowDirection: VerticalDirection.down,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Text(
          widget.exerciseName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: const InputDecoration(
              labelText: 'Last Weight (kg)',
              suffixText: 'kg',
              suffixStyle: TextStyle(color: AppColors.textSecondary),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter a weight';
              }
              final parsed = double.tryParse(value.trim());
              if (parsed == null || parsed <= 0) {
                return 'Enter a positive number';
              }
              return null;
            },
            onFieldSubmitted: (_) => _save(),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
        ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            'Save',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
