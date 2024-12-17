import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/mu_create_provider.dart';
import '../../../../core/constants/app_constants.dart';

class MuCreatePage extends ConsumerStatefulWidget {
  const MuCreatePage({super.key});

  @override
  ConsumerState<MuCreatePage> createState() => _MuCreatePageState();
}

class _MuCreatePageState extends ConsumerState<MuCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _imagePicker = ImagePicker();

  String _selectedTopicLevel1 = '';
  String _selectedTopicLevel2 = '';
  String _selectedCountry = '대한민국';
  String _selectedLanguage = '한국어';
  String? _selectedOfficialType;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(muCreateProvider);
    final notifier = ref.read(muCreateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('뮤 만들기'),
        actions: [
          TextButton(
            onPressed: state.isLoading
                ? null
                : () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      final success = await notifier.createMu(
                        name: _nameController.text,
                        description: _descriptionController.text,
                        topicLevel1: _selectedTopicLevel1,
                        topicLevel2: _selectedTopicLevel2,
                        country: _selectedCountry,
                        language: _selectedLanguage,
                        officialType: _selectedOfficialType,
                      );

                      if (success && mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('뮤가 생성되었습니다'),
                            showCloseIcon: true,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    }
                  },
            child: state.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('만들기'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Profile Image
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface,
                      image: state.profileImage != null
                          ? DecorationImage(
                              image: FileImage(state.profileImage!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: state.profileImage == null
                        ? const Icon(Icons.camera_alt, size: 40)
                        : null,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        icon: const Icon(Icons.edit, size: 18),
                        color: Colors.white,
                        onPressed: () async {
                          final image = await _imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            notifier.setProfileImage(image as String);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Banner Image
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  image: state.bannerImage != null
                      ? DecorationImage(
                          image: FileImage(state.bannerImage!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: state.bannerImage == null
                    ? IconButton(
                        icon: const Icon(Icons.add_photo_alternate, size: 40),
                        onPressed: () async {
                          final image = await _imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          if (image != null) {
                            notifier.setBannerImage(image as String);
                          }
                        },
                      )
                    : Stack(
                        alignment: Alignment.topRight,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              final image = await _imagePicker.pickImage(
                                source: ImageSource.gallery,
                              );
                              if (image != null) {
                                notifier.setBannerImage(image as String);
                              }
                            },
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 24),

            // Mu Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '뮤 이름',
                hintText: '영문, 한글, 숫자 조합 가능',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '뮤 이름은 필수에요';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Description
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: '뮤 설명',
                hintText: '50자 이내로 작성해주세요',
              ),
              maxLength: 50,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '뮤 설명은 필수에요';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Topic Level 1
            DropdownButtonFormField<String>(
              value: _selectedTopicLevel1.isEmpty ? null : _selectedTopicLevel1,
              decoration: const InputDecoration(
                labelText: '주제 분류',
              ),
              items: AppConstants.muCategories.keys.map((topic) {
                return DropdownMenuItem(
                  value: topic,
                  child: Text(topic),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTopicLevel1 = value ?? '';
                  _selectedTopicLevel2 = '';
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '주제 분류를 선택해주세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Topic Level 2
            if (_selectedTopicLevel1.isNotEmpty)
              DropdownButtonFormField<String>(
                value:
                    _selectedTopicLevel2.isEmpty ? null : _selectedTopicLevel2,
                decoration: const InputDecoration(
                  labelText: '세부 분류',
                ),
                items: AppConstants.muCategories[_selectedTopicLevel1]
                    ?.map((topic) {
                  return DropdownMenuItem(
                    value: topic,
                    child: Text(topic),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTopicLevel2 = value ?? '';
                    _updateOfficialType(value);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '세부 분류를 선택해주세요';
                  }
                  return null;
                },
              ),
            const SizedBox(height: 16),

            // Country
            DropdownButtonFormField<String>(
              value: _selectedCountry,
              decoration: const InputDecoration(
                labelText: '국가',
              ),
              items: const [
                DropdownMenuItem(
                  value: '대한민국',
                  child: Text('대한민국'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value ?? '대한민국';
                });
              },
            ),
            const SizedBox(height: 16),

            // Language
            DropdownButtonFormField<String>(
              value: _selectedLanguage,
              decoration: const InputDecoration(
                labelText: '언어',
              ),
              items: const [
                DropdownMenuItem(
                  value: '한국어',
                  child: Text('한국어'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value ?? '한국어';
                });
              },
            ),

            // Official Type (if applicable)
            if (_selectedOfficialType != null) ...[
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedOfficialType,
                decoration: const InputDecoration(
                  labelText: '공식 계정 유형',
                ),
                items: _getOfficialTypeItems(),
                onChanged: (value) {
                  setState(() {
                    _selectedOfficialType = value;
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _updateOfficialType(String? topicLevel2) {
    switch (topicLevel2) {
      case '정치인':
      case '정당':
      case '뉴스':
      case '여론조사':
        _selectedOfficialType = topicLevel2;
        break;
      default:
        _selectedOfficialType = null;
    }
  }

  List<DropdownMenuItem<String>> _getOfficialTypeItems() {
    switch (_selectedTopicLevel2) {
      case '정치인':
        return const [
          DropdownMenuItem(value: '국회의원', child: Text('국회의원')),
          DropdownMenuItem(value: '대통령', child: Text('대통령')),
          DropdownMenuItem(value: '시도지사', child: Text('시도지사')),
          DropdownMenuItem(value: '정치인', child: Text('정치인')),
        ];
      case '정당':
        return const [
          DropdownMenuItem(value: '정당', child: Text('정당')),
        ];
      case '뉴스':
        return const [
          DropdownMenuItem(value: '언론사', child: Text('언론사')),
        ];
      case '여론조사':
        return const [
          DropdownMenuItem(value: '여론조사기관', child: Text('여론조사기관')),
        ];
      default:
        return [];
    }
  }
}
