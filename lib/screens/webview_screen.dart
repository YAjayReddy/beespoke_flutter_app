import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/history_provider.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  final String imageUrl;
  final int productId;

  const WebViewScreen({
    super.key,
    required this.url,
    required this.imageUrl,
    required this.productId,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  double _progress = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    final historyProvider =
    Provider.of<HistoryProvider>(context, listen: false);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            setState(() {
              _progress = progress / 100;
            });
          },
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });

            historyProvider.addToHistory(
              productId: widget.productId,
              image: widget.imageUrl, // ✅ FIXED
            );
          },
          onWebResourceError: (_) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Failed to load page"),
                ),
              );
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _handleBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      if (mounted) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Browser"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_isLoading)
            LinearProgressIndicator(value: _progress),

          Expanded(
            child: WillPopScope(
              onWillPop: () async {
                await _handleBack();
                return false;
              },
              child: WebViewWidget(controller: _controller),
            ),
          ),
        ],
      ),
    );
  }
}