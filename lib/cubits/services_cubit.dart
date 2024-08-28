import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../data/models/transport_service_model.dart';

class YServiceCubit extends Cubit<int> {
  YServiceCubit() : super(0);

  final transportServices = <TransportServiceModel>[
    TransportServiceModel(name: "Yo'lovchi", icon: FeatherIcons.user),
    TransportServiceModel(name: "Pochta", icon: FeatherIcons.box),
  ];

  var currentIndex = 0;

  void chooseService(int index) => emit(index);
}
