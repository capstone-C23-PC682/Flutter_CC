import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trascan/page/home/home.dart';

import '../../service/providers/riwayat/riwayat_provider.dart';
import '../widgets/finite_state.dart';
import 'productdetail.dart';

class Takehistroy extends StatefulWidget {
  const Takehistroy({Key? key}) : super(key: key);

  @override
  State<Takehistroy> createState() => _HistoryState();
}

class _HistoryState extends State<Takehistroy> {
  @override
  void initState() {
    super.initState();
    Provider.of<RiwayatProvider>(context, listen: false).fetchRiwayat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false);
          },
        ),
      ),
      body: Consumer<RiwayatProvider>(
        builder: (context, provider, _) {
          if (provider.myState == MyState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.myState == MyState.failed) {
            return const Center(child: Text('Failed to fetch history'));
          } else {
            final historyList = provider.riwayat?.data ?? [];
            return ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (BuildContext context, int index) {
                final historyItem = historyList[index];
                final data = historyItem.data;
                final status = historyItem.status;
                final registerAt = historyItem.registerAt;

                return ListTile(
                  title: Text('Data: $data'),
                  subtitle:
                      Text('Status: $status\nDate: ${registerAt.toDate()}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailgarbage(
                          keadaan: 1,
                          id: data,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
