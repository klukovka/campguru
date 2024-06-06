import 'package:auto_route/auto_route.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:localizations/localizations.dart';
import 'package:presentation/presentation.dart';
import 'package:presentation/src/pages/user/subscription_page/views/subscription_tile.dart';
import 'package:presentation/src/utils/extensions/build_context_extension.dart';

enum SubscriptionPageField {
  card,
  cardExpMonth,
  cardExpYear,
  cardHolderName,
  cardCvv,
  phone,
  subscription,
}

@RoutePage()
class SubscriptionPage extends StatefulWidget implements AutoRouteWrapper {
  const SubscriptionPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value: context.locator<SubscriptionPageCubit>(),
      child: this,
    );
  }

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  FormBuilderState? get _fbState => _fbKey.currentState;
  Map<String, dynamic> get _fbValues => _fbState?.value ?? {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionPageCubit, SubscriptionPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        //TODO: Add case if user has subs
        return Scaffold(
          appBar: AppBar(
            title: Text(context.strings.subscription),
          ),
          body: AutovalidateModeNotificationBuilder(
            builder: (context, autovalidateMode, child) => FormBuilder(
              key: _fbKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildCreditCard(),
                    const SizedBox(height: 16),
                    _buildCreditCardField(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildMonthField()),
                        const SizedBox(width: 16),
                        Expanded(child: _buildYearField()),
                        const SizedBox(width: 16),
                        Expanded(child: _buildCvvField())
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildPhoneField(),
                    const SizedBox(height: 16),
                    _buildCardHolderNameField(),
                    const SizedBox(height: 16),
                    _buildSubscriptionType(state),
                    _buildSaveButton(context, state),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubscriptionType(SubscriptionPageState state) {
    return FormBuilderRadioGroup(
      name: SubscriptionPageField.subscription.name,
      orientation: OptionsOrientation.vertical,
      decoration: const InputDecoration(
        labelText: 'Subscription Type',
      ),
      validator: FormBuilderValidators.required(),
      options: state.subscriptions
          .map(
            (e) => FormBuilderFieldOption(
              value: e,
              child: SubscriptionTile(subscription: e),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCardHolderNameField() {
    return FormBuilderTextField(
      name: SubscriptionPageField.cardHolderName.name,
      decoration: const InputDecoration(labelText: 'Card Holder Name'),
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildPhoneField() {
    return FormBuilderTextField(
      name: SubscriptionPageField.phone.name,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Phone', prefixText: '+38'),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildYearField() {
    return FormBuilderDropdown(
      name: SubscriptionPageField.cardExpYear.name,
      decoration: const InputDecoration(labelText: 'Year'),
      validator: FormBuilderValidators.required(),
      items: [
        '24',
        '25',
        '26',
        '27',
        '28',
        '29',
        '30',
      ].map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildMonthField() {
    return FormBuilderDropdown(
      name: SubscriptionPageField.cardExpMonth.name,
      decoration: const InputDecoration(labelText: 'Month'),
      validator: FormBuilderValidators.required(),
      items: [
        '01',
        '02',
        '03',
        '04',
        '05',
        '06',
        '07',
        '08',
        '09',
        '10',
        '11',
        '12',
      ].map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildCreditCardField() {
    return FormBuilderTextField(
      name: SubscriptionPageField.card.name,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'Credit card'),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
      ],
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
          FormBuilderValidators.creditCard(),
        ],
      ),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildCvvField() {
    return FormBuilderTextField(
      name: SubscriptionPageField.cardCvv.name,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(labelText: 'CVV'),
      inputFormatters: [
        LengthLimitingTextInputFormatter(3),
      ],
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        setState(() {
          _fbState?.save();
        });
      },
    );
  }

  Widget _buildCreditCard() {
    final cardNumber = _fbValues[SubscriptionPageField.card.name] ?? '';
    final String cardExpMonth =
        _fbValues[SubscriptionPageField.cardExpMonth.name] ?? '';
    final String cardExpYear =
        _fbValues[SubscriptionPageField.cardExpYear.name] ?? '';
    final cardHolderName =
        _fbValues[SubscriptionPageField.cardHolderName.name] ?? '';
    final cvvCode = _fbValues[SubscriptionPageField.cardCvv.name] ?? '';
    return CreditCardWidget(
      cardNumber: cardNumber,
      expiryDate: cardExpMonth.isNotEmpty && cardExpYear.isNotEmpty
          ? '$cardExpMonth/$cardExpYear'
          : '',
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      showBackView: false,
      obscureCardCvv: false,
      obscureCardNumber: false,
      isHolderNameVisible: true,
      cardType: CardType.mastercard,
      onCreditCardWidgetChange: (creditCardBrand) {},
    );
  }

  Widget _buildSaveButton(
    BuildContext context,
    SubscriptionPageState state,
  ) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        bottom: MediaQuery.paddingOf(context).bottom,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          AutovalidateModeNotification(
            AutovalidateMode.onUserInteraction,
          ).dispatch(context);
          if (_fbState?.saveAndValidate() ?? false) {}
        },
        child: state.isLoading
            ? const Padding(
                padding: EdgeInsets.all(4),
                child: CircularProgressIndicator(),
              )
            : Text(context.strings.complete),
      ),
    );
  }
}
