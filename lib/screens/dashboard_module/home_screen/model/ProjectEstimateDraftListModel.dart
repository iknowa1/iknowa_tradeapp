class ProjectEstimateDraftListModel {
  int? id;
  String? refId;
  String? name;
  String? postcode;
  String? description;
  String? type;
  String? latitude;
  String? longitude;
  List<Null>? categories;
  List<ProjectProperties>? projectProperties;
  UserWorkstation? userWorkstation;

  ProjectEstimateDraftListModel(
      {this.id, this.refId, this.name, this.postcode, this.description, this.type, this.latitude, this.longitude, this.categories, this.projectProperties, this.userWorkstation});

  ProjectEstimateDraftListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    refId = json['refId'];
    name = json['name'];
    postcode = json['postcode'];
    description = json['description'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    // if (json['categories'] != null) {
    //   categories = <Null>[];
    //   json['categories'].forEach((v) {
    //     categories!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['projectProperties'] != null) {
      projectProperties = <ProjectProperties>[];
      json['projectProperties'].forEach((v) {
        projectProperties!.add(new ProjectProperties.fromJson(v));
      });
    }
    userWorkstation = json['userWorkstation'] != null ? new UserWorkstation.fromJson(json['userWorkstation']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['refId'] = this.refId;
    data['name'] = this.name;
    data['postcode'] = this.postcode;
    data['description'] = this.description;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    // if (this.categories != null) {
    //   data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    // }
    if (this.projectProperties != null) {
      data['projectProperties'] = this.projectProperties!.map((v) => v.toJson()).toList();
    }
    if (this.userWorkstation != null) {
      data['userWorkstation'] = this.userWorkstation!.toJson();
    }
    return data;
  }
}

class ProjectProperties {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? nickName;
  Property? property;
  String? distance;

  ProjectProperties({this.id, this.dateCreated, this.dateUpdated, this.nickName, this.property, this.distance});

  ProjectProperties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    nickName = json['nickName'];
    property = json['property'] != null ? new Property.fromJson(json['property']) : null;
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['nickName'] = this.nickName;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    data['distance'] = this.distance;
    return data;
  }
}

class Property {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? address;
  String? refId;
  String? countryCode;
  String? nickname;
  String? postcode;
  String? uprn;
  String? beds;
  String? baths;
  String? reception;
  String? propertyType;
  String? energyRating;
  String? propertyCategory;
  String? propertySize;
  String? tenure;
  String? yearsOfLease;
  String? addressData;
  int? maxMemberLimit;
  String? epcData;
  String? subscription;
  String? propertyRole;
  String? companyName;
  String? epcDisplay;
  EpcDomestic? epcDomestic;
  String? epcNonDomestic;
  String? epcUpdatedDate;
  List<Valuation>? valuation;

  Property(
      {this.id,
      this.dateCreated,
      this.dateUpdated,
      this.address,
      this.refId,
      this.countryCode,
      this.nickname,
      this.postcode,
      this.uprn,
      this.beds,
      this.baths,
      this.reception,
      this.propertyType,
      this.energyRating,
      this.propertyCategory,
      this.propertySize,
      this.tenure,
      this.yearsOfLease,
      this.addressData,
      this.maxMemberLimit,
      this.epcData,
      this.subscription,
      this.propertyRole,
      this.companyName,
      this.epcDisplay,
      this.epcDomestic,
      this.epcNonDomestic,
      this.epcUpdatedDate,
      this.valuation});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    address = json['address'];
    refId = json['refId'];
    countryCode = json['countryCode'];
    nickname = json['nickname'];
    postcode = json['postcode'];
    uprn = json['uprn'];
    beds = json['beds'];
    baths = json['baths'];
    reception = json['reception'];
    propertyType = json['propertyType'];
    energyRating = json['energyRating'];
    propertyCategory = json['propertyCategory'];
    propertySize = json['propertySize'];
    tenure = json['tenure'];
    yearsOfLease = json['yearsOfLease'];
    addressData = json['addressData'];
    maxMemberLimit = json['maxMemberLimit'];
    epcData = json['epcData'];
    subscription = json['subscription'];
    propertyRole = json['propertyRole'];
    companyName = json['companyName'];
    epcDisplay = json['epcDisplay'];
    epcDomestic = json['epcDomestic'] != null ? new EpcDomestic.fromJson(json['epcDomestic']) : null;
    epcNonDomestic = json['epcNonDomestic'];
    epcUpdatedDate = json['epcUpdatedDate'];
    if (json['valuation'] != null) {
      valuation = <Valuation>[];
      json['valuation'].forEach((v) {
        valuation!.add(new Valuation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['address'] = this.address;
    data['refId'] = this.refId;
    data['countryCode'] = this.countryCode;
    data['nickname'] = this.nickname;
    data['postcode'] = this.postcode;
    data['uprn'] = this.uprn;
    data['beds'] = this.beds;
    data['baths'] = this.baths;
    data['reception'] = this.reception;
    data['propertyType'] = this.propertyType;
    data['energyRating'] = this.energyRating;
    data['propertyCategory'] = this.propertyCategory;
    data['propertySize'] = this.propertySize;
    data['tenure'] = this.tenure;
    data['yearsOfLease'] = this.yearsOfLease;
    data['addressData'] = this.addressData;
    data['maxMemberLimit'] = this.maxMemberLimit;
    data['epcData'] = this.epcData;
    data['subscription'] = this.subscription;
    data['propertyRole'] = this.propertyRole;
    data['companyName'] = this.companyName;
    data['epcDisplay'] = this.epcDisplay;
    if (this.epcDomestic != null) {
      data['epcDomestic'] = this.epcDomestic!.toJson();
    }
    data['epcNonDomestic'] = this.epcNonDomestic;
    data['epcUpdatedDate'] = this.epcUpdatedDate;
    if (this.valuation != null) {
      data['valuation'] = this.valuation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EpcDomestic {
  Roof? roof;
  int? uprn;
  Walls? walls;
  String? county;
  Energy? energy;
  Floors? floors;
  String? source;
  String? tenure;
  String? address;
  Heating? heating;
  String? lmkKey;
  Windows? windows;
  String? address1;
  String? address2;
  String? address3;
  Lighting? lighting;
  String? postcode;
  String? posttown;
  String? builtForm;
  String? glazedArea;
  String? glazedType;
  String? uprnSource;
  Ventilation? ventilation;
  String? constituency;
  String? propertyType;
  String? lodgementDate;
  String? mainsGasFlag;
  String? extensionCount;
  String? inspectionDate;
  String? localAuthority;
  String? recommendations;
  String? transactionType;
  String? constituencyLabel;
  String? lodgementDatetime;
  String? numberHeatedRooms;
  String? constructionAgeBand;
  String? localAuthorityLabel;
  String? multiGlazeProportion;
  String? numberHabitableRooms;
  int? numberOpenFireplaces;
  String? buildingReferenceNumber;
  int? environmentalImpactCurrent;
  int? environmentalImpactPotential;

  EpcDomestic(
      {this.roof,
      this.uprn,
      this.walls,
      this.county,
      this.energy,
      this.floors,
      this.source,
      this.tenure,
      this.address,
      this.heating,
      this.lmkKey,
      this.windows,
      this.address1,
      this.address2,
      this.address3,
      this.lighting,
      this.postcode,
      this.posttown,
      this.builtForm,
      this.glazedArea,
      this.glazedType,
      this.uprnSource,
      this.ventilation,
      this.constituency,
      this.propertyType,
      this.lodgementDate,
      this.mainsGasFlag,
      this.extensionCount,
      this.inspectionDate,
      this.localAuthority,
      this.recommendations,
      this.transactionType,
      this.constituencyLabel,
      this.lodgementDatetime,
      this.numberHeatedRooms,
      this.constructionAgeBand,
      this.localAuthorityLabel,
      this.multiGlazeProportion,
      this.numberHabitableRooms,
      this.numberOpenFireplaces,
      this.buildingReferenceNumber,
      this.environmentalImpactCurrent,
      this.environmentalImpactPotential});

  EpcDomestic.fromJson(Map<String, dynamic> json) {
    roof = json['roof'] != null ? new Roof.fromJson(json['roof']) : null;
    uprn = json['uprn'];
    walls = json['walls'] != null ? new Walls.fromJson(json['walls']) : null;
    county = json['county'];
    energy = json['energy'] != null ? new Energy.fromJson(json['energy']) : null;
    floors = json['floors'] != null ? new Floors.fromJson(json['floors']) : null;
    source = json['source'];
    tenure = json['tenure'];
    address = json['address'];
    heating = json['heating'] != null ? new Heating.fromJson(json['heating']) : null;
    lmkKey = json['lmk_key'];
    windows = json['windows'] != null ? new Windows.fromJson(json['windows']) : null;
    address1 = json['address1'];
    address2 = json['address2'];
    address3 = json['address3'];
    lighting = json['lighting'] != null ? new Lighting.fromJson(json['lighting']) : null;
    postcode = json['postcode'];
    posttown = json['posttown'];
    builtForm = json['built_form'];
    glazedArea = json['glazed_area'];
    glazedType = json['glazed_type'];
    uprnSource = json['uprn_source'];
    ventilation = json['ventilation'] != null ? new Ventilation.fromJson(json['ventilation']) : null;
    constituency = json['constituency'];
    propertyType = json['property_type'];
    lodgementDate = json['lodgement_date'];
    mainsGasFlag = json['mains_gas_flag'];
    extensionCount = json['extension_count'];
    inspectionDate = json['inspection_date'];
    localAuthority = json['local_authority'];
    recommendations = json['recommendations'];
    transactionType = json['transaction_type'];
    constituencyLabel = json['constituency_label'];
    lodgementDatetime = json['lodgement_datetime'];
    numberHeatedRooms = json['number_heated_rooms'];
    constructionAgeBand = json['construction_age_band'];
    localAuthorityLabel = json['local_authority_label'];
    multiGlazeProportion = json['multi_glaze_proportion'];
    numberHabitableRooms = json['number_habitable_rooms'];
    numberOpenFireplaces = json['number_open_fireplaces'];
    buildingReferenceNumber = json['building_reference_number'];
    environmentalImpactCurrent = json['environmental_impact_current'];
    environmentalImpactPotential = json['environmental_impact_potential'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roof != null) {
      data['roof'] = this.roof!.toJson();
    }
    data['uprn'] = this.uprn;
    if (this.walls != null) {
      data['walls'] = this.walls!.toJson();
    }
    data['county'] = this.county;
    if (this.energy != null) {
      data['energy'] = this.energy!.toJson();
    }
    if (this.floors != null) {
      data['floors'] = this.floors!.toJson();
    }
    data['source'] = this.source;
    data['tenure'] = this.tenure;
    data['address'] = this.address;
    if (this.heating != null) {
      data['heating'] = this.heating!.toJson();
    }
    data['lmk_key'] = this.lmkKey;
    if (this.windows != null) {
      data['windows'] = this.windows!.toJson();
    }
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['address3'] = this.address3;
    if (this.lighting != null) {
      data['lighting'] = this.lighting!.toJson();
    }
    data['postcode'] = this.postcode;
    data['posttown'] = this.posttown;
    data['built_form'] = this.builtForm;
    data['glazed_area'] = this.glazedArea;
    data['glazed_type'] = this.glazedType;
    data['uprn_source'] = this.uprnSource;
    if (this.ventilation != null) {
      data['ventilation'] = this.ventilation!.toJson();
    }
    data['constituency'] = this.constituency;
    data['property_type'] = this.propertyType;
    data['lodgement_date'] = this.lodgementDate;
    data['mains_gas_flag'] = this.mainsGasFlag;
    data['extension_count'] = this.extensionCount;
    data['inspection_date'] = this.inspectionDate;
    data['local_authority'] = this.localAuthority;
    data['recommendations'] = this.recommendations;
    data['transaction_type'] = this.transactionType;
    data['constituency_label'] = this.constituencyLabel;
    data['lodgement_datetime'] = this.lodgementDatetime;
    data['number_heated_rooms'] = this.numberHeatedRooms;
    data['construction_age_band'] = this.constructionAgeBand;
    data['local_authority_label'] = this.localAuthorityLabel;
    data['multi_glaze_proportion'] = this.multiGlazeProportion;
    data['number_habitable_rooms'] = this.numberHabitableRooms;
    data['number_open_fireplaces'] = this.numberOpenFireplaces;
    data['building_reference_number'] = this.buildingReferenceNumber;
    data['environmental_impact_current'] = this.environmentalImpactCurrent;
    data['environmental_impact_potential'] = this.environmentalImpactPotential;
    return data;
  }
}

class Roof {
  String? roofEnvEff;
  String? roofEnergyEff;
  String? roofDescription;

  Roof({this.roofEnvEff, this.roofEnergyEff, this.roofDescription});

  Roof.fromJson(Map<String, dynamic> json) {
    roofEnvEff = json['roof_env_eff'];
    roofEnergyEff = json['roof_energy_eff'];
    roofDescription = json['roof_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roof_env_eff'] = this.roofEnvEff;
    data['roof_energy_eff'] = this.roofEnergyEff;
    data['roof_description'] = this.roofDescription;
    return data;
  }
}

class Walls {
  String? wallsEnvEff;
  String? wallsEnergyEff;
  String? wallsDescription;

  Walls({this.wallsEnvEff, this.wallsEnergyEff, this.wallsDescription});

  Walls.fromJson(Map<String, dynamic> json) {
    wallsEnvEff = json['walls_env_eff'];
    wallsEnergyEff = json['walls_energy_eff'];
    wallsDescription = json['walls_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['walls_env_eff'] = this.wallsEnvEff;
    data['walls_energy_eff'] = this.wallsEnergyEff;
    data['walls_description'] = this.wallsDescription;
    return data;
  }
}

class Energy {
  String? energyTariff;
  String? primaryEnergyValue;
  String? currentEnergyRating;
  String? potentialEnergyRating;
  int? currentEnergyEfficiency;
  int? energyConsumptionCurrent;
  int? potentialEnergyEfficiency;
  int? energyConsumptionPotential;

  Energy(
      {this.energyTariff,
      this.primaryEnergyValue,
      this.currentEnergyRating,
      this.potentialEnergyRating,
      this.currentEnergyEfficiency,
      this.energyConsumptionCurrent,
      this.potentialEnergyEfficiency,
      this.energyConsumptionPotential});

  Energy.fromJson(Map<String, dynamic> json) {
    energyTariff = json['energy_tariff'];
    primaryEnergyValue = json['primary_energy_value'];
    currentEnergyRating = json['current_energy_rating'];
    potentialEnergyRating = json['potential_energy_rating'];
    currentEnergyEfficiency = json['current_energy_efficiency'];
    energyConsumptionCurrent = json['energy_consumption_current'];
    potentialEnergyEfficiency = json['potential_energy_efficiency'];
    energyConsumptionPotential = json['energy_consumption_potential'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['energy_tariff'] = this.energyTariff;
    data['primary_energy_value'] = this.primaryEnergyValue;
    data['current_energy_rating'] = this.currentEnergyRating;
    data['potential_energy_rating'] = this.potentialEnergyRating;
    data['current_energy_efficiency'] = this.currentEnergyEfficiency;
    data['energy_consumption_current'] = this.energyConsumptionCurrent;
    data['potential_energy_efficiency'] = this.potentialEnergyEfficiency;
    data['energy_consumption_potential'] = this.energyConsumptionPotential;
    return data;
  }
}

class Floors {
  String? floorLevel;
  String? floorEnvEff;
  String? floorEnergyEff;
  int? totalFloorArea;
  String? floorDescription;
  int? co2EmissCurrPerFloorArea;

  Floors({this.floorLevel, this.floorEnvEff, this.floorEnergyEff, this.totalFloorArea, this.floorDescription, this.co2EmissCurrPerFloorArea});

  Floors.fromJson(Map<String, dynamic> json) {
    floorLevel = json['floor_level'];
    floorEnvEff = json['floor_env_eff'];
    floorEnergyEff = json['floor_energy_eff'];
    totalFloorArea = json['total_floor_area'];
    floorDescription = json['floor_description'];
    co2EmissCurrPerFloorArea = json['co2_emiss_curr_per_floor_area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floor_level'] = this.floorLevel;
    data['floor_env_eff'] = this.floorEnvEff;
    data['floor_energy_eff'] = this.floorEnergyEff;
    data['total_floor_area'] = this.totalFloorArea;
    data['floor_description'] = this.floorDescription;
    data['co2_emiss_curr_per_floor_area'] = this.co2EmissCurrPerFloorArea;
    return data;
  }
}

class Heating {
  String? otherFuel;
  String? heatingCo2;
  String? otherFuelDesc;
  String? mainHeatingFuel;
  String? mainheatcEnvEff;
  String? heatLossCorridor;
  String? mainheatEnergyEff;
  int? heatingCostCurrent;
  String? mainheatDescription;
  String? mainheatcEnergyEff;
  String? mainHeatingControls;
  int? heatingCostPotential;
  String? secondheatDescription;
  String? mainheatcontDescription;
  String? solarWaterHeatingFlag;

  Heating(
      {this.otherFuel,
      this.heatingCo2,
      this.otherFuelDesc,
      this.mainHeatingFuel,
      this.mainheatcEnvEff,
      this.heatLossCorridor,
      this.mainheatEnergyEff,
      this.heatingCostCurrent,
      this.mainheatDescription,
      this.mainheatcEnergyEff,
      this.mainHeatingControls,
      this.heatingCostPotential,
      this.secondheatDescription,
      this.mainheatcontDescription,
      this.solarWaterHeatingFlag});

  Heating.fromJson(Map<String, dynamic> json) {
    otherFuel = json['other_fuel'];
    heatingCo2 = json['heating_co2'];
    otherFuelDesc = json['other_fuel_desc'];
    mainHeatingFuel = json['main_heating_fuel'];
    mainheatcEnvEff = json['mainheatc_env_eff'];
    heatLossCorridor = json['heat_loss_corridor'];
    mainheatEnergyEff = json['mainheat_energy_eff'];
    heatingCostCurrent = json['heating_cost_current'];
    mainheatDescription = json['mainheat_description'];
    mainheatcEnergyEff = json['mainheatc_energy_eff'];
    mainHeatingControls = json['main_heating_controls'];
    heatingCostPotential = json['heating_cost_potential'];
    secondheatDescription = json['secondheat_description'];
    mainheatcontDescription = json['mainheatcont_description'];
    solarWaterHeatingFlag = json['solar_water_heating_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['other_fuel'] = this.otherFuel;
    data['heating_co2'] = this.heatingCo2;
    data['other_fuel_desc'] = this.otherFuelDesc;
    data['main_heating_fuel'] = this.mainHeatingFuel;
    data['mainheatc_env_eff'] = this.mainheatcEnvEff;
    data['heat_loss_corridor'] = this.heatLossCorridor;
    data['mainheat_energy_eff'] = this.mainheatEnergyEff;
    data['heating_cost_current'] = this.heatingCostCurrent;
    data['mainheat_description'] = this.mainheatDescription;
    data['mainheatc_energy_eff'] = this.mainheatcEnergyEff;
    data['main_heating_controls'] = this.mainHeatingControls;
    data['heating_cost_potential'] = this.heatingCostPotential;
    data['secondheat_description'] = this.secondheatDescription;
    data['mainheatcont_description'] = this.mainheatcontDescription;
    data['solar_water_heating_flag'] = this.solarWaterHeatingFlag;
    return data;
  }
}

class Windows {
  String? windowsEnvEff;
  String? windowsEnergyEff;
  String? windowsDescription;

  Windows({this.windowsEnvEff, this.windowsEnergyEff, this.windowsDescription});

  Windows.fromJson(Map<String, dynamic> json) {
    windowsEnvEff = json['windows_env_eff'];
    windowsEnergyEff = json['windows_energy_eff'];
    windowsDescription = json['windows_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['windows_env_eff'] = this.windowsEnvEff;
    data['windows_energy_eff'] = this.windowsEnergyEff;
    data['windows_description'] = this.windowsDescription;
    return data;
  }
}

class Lighting {
  String? lightingEnvEff;
  String? lightingEnergyEff;
  int? lowEnergyLighting;
  String? lightingDescription;
  int? lightingCostCurrent;
  int? lightingCostPotential;
  int? fixedLightingOutletsCount;
  int? lowEnergyFixedLightCount;

  Lighting(
      {this.lightingEnvEff,
      this.lightingEnergyEff,
      this.lowEnergyLighting,
      this.lightingDescription,
      this.lightingCostCurrent,
      this.lightingCostPotential,
      this.fixedLightingOutletsCount,
      this.lowEnergyFixedLightCount});

  Lighting.fromJson(Map<String, dynamic> json) {
    lightingEnvEff = json['lighting_env_eff'];
    lightingEnergyEff = json['lighting_energy_eff'];
    lowEnergyLighting = json['low_energy_lighting'];
    lightingDescription = json['lighting_description'];
    lightingCostCurrent = json['lighting_cost_current'];
    lightingCostPotential = json['lighting_cost_potential'];
    fixedLightingOutletsCount = json['fixed_lighting_outlets_count'];
    lowEnergyFixedLightCount = json['low_energy_fixed_light_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lighting_env_eff'] = this.lightingEnvEff;
    data['lighting_energy_eff'] = this.lightingEnergyEff;
    data['low_energy_lighting'] = this.lowEnergyLighting;
    data['lighting_description'] = this.lightingDescription;
    data['lighting_cost_current'] = this.lightingCostCurrent;
    data['lighting_cost_potential'] = this.lightingCostPotential;
    data['fixed_lighting_outlets_count'] = this.fixedLightingOutletsCount;
    data['low_energy_fixed_light_count'] = this.lowEnergyFixedLightCount;
    return data;
  }
}

class Ventilation {
  String? mechanicalVentilation;

  Ventilation({this.mechanicalVentilation});

  Ventilation.fromJson(Map<String, dynamic> json) {
    mechanicalVentilation = json['mechanical_ventilation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mechanical_ventilation'] = this.mechanicalVentilation;
    return data;
  }
}

class Valuation {
  int? id;
  String? paon;
  String? saon;
  String? town;
  String? data1;
  String? data2;
  String? data4;
  String? data5;
  String? county;
  String? street;
  String? district;
  String? locality;
  String? postcode;
  int? pricePaid;
  String? estateType;
  String? customAddress;
  String? transactionId;
  String? transactionDate;

  Valuation(
      {this.id,
      this.paon,
      this.saon,
      this.town,
      this.data1,
      this.data2,
      this.data4,
      this.data5,
      this.county,
      this.street,
      this.district,
      this.locality,
      this.postcode,
      this.pricePaid,
      this.estateType,
      this.customAddress,
      this.transactionId,
      this.transactionDate});

  Valuation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paon = json['paon'];
    saon = json['saon'];
    town = json['town'];
    data1 = json['data1'];
    data2 = json['data2'];
    data4 = json['data4'];
    data5 = json['data5'];
    county = json['county'];
    street = json['street'];
    district = json['district'];
    locality = json['locality'];
    postcode = json['postcode'];
    pricePaid = json['price_paid'];
    estateType = json['estate_type'];
    customAddress = json['custom_address'];
    transactionId = json['transaction_id'];
    transactionDate = json['transaction_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paon'] = this.paon;
    data['saon'] = this.saon;
    data['town'] = this.town;
    data['data1'] = this.data1;
    data['data2'] = this.data2;
    data['data4'] = this.data4;
    data['data5'] = this.data5;
    data['county'] = this.county;
    data['street'] = this.street;
    data['district'] = this.district;
    data['locality'] = this.locality;
    data['postcode'] = this.postcode;
    data['price_paid'] = this.pricePaid;
    data['estate_type'] = this.estateType;
    data['custom_address'] = this.customAddress;
    data['transaction_id'] = this.transactionId;
    data['transaction_date'] = this.transactionDate;
    return data;
  }
}

class UserWorkstation {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;
  String? status;
  String? subStatus;
  String? subscription;
  String? threeMonthSubscription;
  String? documentSubscription;
  String? membersSubscription;
  int? maxMemberLimit;
  int? seatsUsed;
  String? verificationStatus;
  String? submittedInformationAt;
  String? description;
  String? profileImage;
  String? experience;
  bool? isAvailable;
  bool? isShowTradeNetwork;
  String? emergencyCallOutFee;
  String? videoConsulationFee;
  String? emergencyCallOutFeeType;
  String? emergencyCallOutRate;
  String? workstationVerificationType;
  bool? isWsFreezed;

  UserWorkstation(
      {this.id,
      this.dateCreated,
      this.dateUpdated,
      this.name,
      this.status,
      this.subStatus,
      this.subscription,
      this.threeMonthSubscription,
      this.documentSubscription,
      this.membersSubscription,
      this.maxMemberLimit,
      this.seatsUsed,
      this.verificationStatus,
      this.submittedInformationAt,
      this.description,
      this.profileImage,
      this.experience,
      this.isAvailable,
      this.isShowTradeNetwork,
      this.emergencyCallOutFee,
      this.videoConsulationFee,
      this.emergencyCallOutFeeType,
      this.emergencyCallOutRate,
      this.workstationVerificationType,
      this.isWsFreezed});

  UserWorkstation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    name = json['name'];
    status = json['status'];
    subStatus = json['subStatus'];
    subscription = json['subscription'];
    threeMonthSubscription = json['threeMonthSubscription'];
    documentSubscription = json['documentSubscription'];
    membersSubscription = json['membersSubscription'];
    maxMemberLimit = json['maxMemberLimit'];
    seatsUsed = json['seatsUsed'];
    verificationStatus = json['verificationStatus'];
    submittedInformationAt = json['submittedInformationAt'];
    description = json['description'];
    profileImage = json['profileImage'];
    experience = json['experience'];
    isAvailable = json['isAvailable'];
    isShowTradeNetwork = json['isShowTradeNetwork'];
    emergencyCallOutFee = json['emergencyCallOutFee'];
    videoConsulationFee = json['videoConsulationFee'];
    emergencyCallOutFeeType = json['emergencyCallOutFeeType'];
    emergencyCallOutRate = json['emergencyCallOutRate'];
    workstationVerificationType = json['workstationVerificationType'];
    isWsFreezed = json['isWsFreezed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['name'] = this.name;
    data['status'] = this.status;
    data['subStatus'] = this.subStatus;
    data['subscription'] = this.subscription;
    data['threeMonthSubscription'] = this.threeMonthSubscription;
    data['documentSubscription'] = this.documentSubscription;
    data['membersSubscription'] = this.membersSubscription;
    data['maxMemberLimit'] = this.maxMemberLimit;
    data['seatsUsed'] = this.seatsUsed;
    data['verificationStatus'] = this.verificationStatus;
    data['submittedInformationAt'] = this.submittedInformationAt;
    data['description'] = this.description;
    data['profileImage'] = this.profileImage;
    data['experience'] = this.experience;
    data['isAvailable'] = this.isAvailable;
    data['isShowTradeNetwork'] = this.isShowTradeNetwork;
    data['emergencyCallOutFee'] = this.emergencyCallOutFee;
    data['videoConsulationFee'] = this.videoConsulationFee;
    data['emergencyCallOutFeeType'] = this.emergencyCallOutFeeType;
    data['emergencyCallOutRate'] = this.emergencyCallOutRate;
    data['workstationVerificationType'] = this.workstationVerificationType;
    data['isWsFreezed'] = this.isWsFreezed;
    return data;
  }
}
