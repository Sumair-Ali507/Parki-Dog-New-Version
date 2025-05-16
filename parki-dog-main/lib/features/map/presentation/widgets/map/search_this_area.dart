import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../busniess_logic/map_cubit/map_cubit.dart';
import '../../busniess_logic/map_cubit/map_state.dart';

class DogParkSearchButton extends StatelessWidget {
  const DogParkSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return SafeArea(
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state.isLoadingParks
                  ? _buildLoadingButton(context)
                  : _buildSearchButton(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<MapCubit>().searchDogParks(context), // Pass context
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.pets, color: Colors.blue),
          const SizedBox(width: 8),
          Text(
            'search_dog_parks'.tr(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          SizedBox(width: 8),
          Text('Searching...'),
        ],
      ),
    );
  }
}
//---------------orignal------------------
//--------------------------------------
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../busniess_logic/map_cubit/map_cubit.dart';
// import '../../busniess_logic/map_cubit/map_state.dart';

// class DogParkSearchButton extends StatelessWidget {
//   const DogParkSearchButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MapCubit, MapState>(
//       builder: (context, state) {
//         return SafeArea(
//           child: Center(
//             child: AnimatedSwitcher(
//               duration: const Duration(milliseconds: 300),
//               child: state.isLoadingParks
//                   ? _buildLoadingButton(context)
//                   : _buildSearchButton(context),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildSearchButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () => context.read<MapCubit>().searchDogParks(context),  // Pass context here
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Icon(Icons.pets, color: Colors.blue),
//           const SizedBox(width: 8),
//           Text(
//             'search_dog_parks'.tr(),
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoadingButton(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: const Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             width: 20,
//             height: 20,
//             child: CircularProgressIndicator(strokeWidth: 2),
//           ),
//           SizedBox(width: 8),
//           Text('Searching...'),
//         ],
//       ),
//     );
//   }
// }
