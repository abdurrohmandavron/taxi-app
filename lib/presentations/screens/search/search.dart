import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/search_cubit.dart';
import '../../../presentations/widgets/sliding_up_panel_handle.dart';
import '../../../presentations/screens/search/widgets/search_items.dart';
import '../../../presentations/screens/search/widgets/search_input_field.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YSearchCubit, YSearchState>(
      builder: (context, state) {
        final cubit = context.read<YSearchCubit>();

        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Handle
                  const YSlidingUpPanelHandle(),
                  const SizedBox(height: 16),

                  /// Title
                  Text("Qayerdan jo'namoqchisiz?", style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 16),

                  /// Search input field
                  YSearchInputField(cubit: cubit),

                  const SizedBox(height: 10),

                  /// Destinations
                  if (state is YSearchInitial) YSearchItems(cubit: cubit, children: state.destinations),

                  /// Progress Indicator
                  if (state is YSearchLoading) const Center(child: CircularProgressIndicator()),

                  /// Search Results
                  if (state is YSearchSuccess) YSearchItems(cubit: cubit, children: state.searchResults),
                  const SizedBox(height: 16),

                  /// Error Text
                  if (state is YSearchError) Text(state.message, style: const TextStyle(color: Colors.red)),

                  /// Next Button
                  ElevatedButton(onPressed: () {}, child: const Text("Keyingi")),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
