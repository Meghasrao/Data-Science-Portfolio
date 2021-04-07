# TABLE OF CONTENTS

1.	Introduction
>   Project Background

>   What is OCR?

>   Causes and effects of OCR

>   What is Artificial Intelligence?

>   Artificial Neural Networks

>   Gradient Descent

2.	Solution Statement
>   Part I & Part II

>   Prerequisites


# INTRODUCTION

## PROJECT BACKGROUND

Optical Character Recognition (OCR) is one of the most widely implemented types of data entry methods. OCR is a complex technology that converts image containing text into formats with editable text. OCR allows you process scanned books, screenshots and images with text into editable documents like TXT, DOC or PDF files. This technology is widely used in many areas. The most advanced OCR system can handle any type of images, even such complex ones as scanned magazine pages with images and columns or photos from a mobile phone. 

This project involves implementing OCR in the Python programming language for the conversion of image data to characters. Then, feature set and image data set are fed to an Artificial Neural Networks (ANNs) for character recognition. ANN recognizes various 8-bit ASCII English character with good recognition rates.
	
## WHAT IS OCR?
OCR involves digitized scanning and recognition of written or printed text. Here the text is first photo scanned, analyzed, and is finally translated into character codes. This machine-encoded text can be easily searched and edited electronically. Next to keypunching, Optical Character Recognition is the oldest data entry technique in existence. Long before the first key-to-disk system of CRT was used, Optical Character Readers were entering data in commercial and government EDP installations.
OCR has greatly improved the process of data entry. This software tool enables quick conversion of scanned documents to searchable text files. Today, the need for the documents to be scanned is on a constant rise as it enables these documents to be viewed conveniently when required. The scanned documents can also be shared easily through the electronic medium.

CAUSES AND EFFECTS OF OCR
Although there are numerous advantages of OCR, it mainly helps businesses in increasing the effectiveness and efficiency of the work. Its ability to quickly search through enormous content is extremely helpful, particularly in office settings, which deal with high document inflow and high-volume scanning. 

- **Higher Productivity**
OCR software helps businesses to achieve higher productivity by facilitating quicker data retrieval when required. The time and effort which the employees were required to put in for extracting relevant data can now be channelized to focus on core activities. Besides, employees do not have to make numerous trips to central records room to access the required documents, as they can access them without getting up from their desks.

- **Cost Reduction**
Opting for OCR will help businesses on cutting down on hiring professionals to carry out data extraction, which is one of the most important benefits of OCR data entry methods. This tool also helps in trimming various other costs, such as copying, printing, shipping, etc. Therefore, OCR eliminates the cost of misplaced or lost documents and offers higher savings in the form of reclaimed office space, which would otherwise be used for storing paper documents.


- **High Accuracy**
One of the major challenges of data entry is inaccuracy. Automated data entry tools such as OCR data entry result in reduced errors and inaccuracies, resulting in efficient data entry. Besides, problems like data loss can also be successfully tackled by OCR data entry. As there is no manpower involved, the issues such as keying in wrong information accidentally or otherwise can be eliminated.

- **Increased Storage Space**
OCR can scan, document, and catalogue information from enterprise-wide paper documents. This simply means that the data can now be stored in an electronic format in servers, eradicating the need for maintaining huge paper files. In this way, OCR data entry serves as one of the best tools to implement "Paperless" approach across the organization.

- **Superior Data Security**
Data security is of utmost importance for any organization. Paper documents are easily prone to loss or destruction. Papers can be misplaced, stolen, or destroyed by natural elements such as moisture, pests, and fire. However, this is not the case with data that is scanned, analyzed, and stored in digital formats. Furthermore, the access to these digital documents can also be minimized to prevent mishandling of the digitized data.

- **100% Text-searchable Documents**
One of the huge advantages of OCR data processing is that it makes the digitized documents completely text searchable. This helps professionals to quickly lookup numbers, addresses, names, and various other parameters that differentiate the document being searched.

- **Massively Improves Customer Service**
Several inbound contact centers often provide information that their customers seek. While some call centers provide customers with the information they need, the others will have to quickly access certain personal or order-related information of the customers to process their requests. Quick data accessibility becomes extremely important in such cases. OCR helps in systematically storing and retrieving the documents digitally at blazing speeds. With this, the waiting time is drastically reduced for the customers, thereby improving their experience.

- **Makes Documents Editable**
Scanned documents need to be edited most of the time, particularly when some information must be updated. OCR converts data to any preferred formats such as Word, etc., which can be easily edited. This can be of great help when there are contents which have to be constantly updated or regularly changed.

- **Disaster Recovery**
Disaster recovery is one of the major benefits of using OCR for data entry. When data is stored electronically in secure servers and distributed systems, it remains safe even under emergency situations. When there are sudden fire breakouts or natural calamity, the digitized data can be quickly retrieved to ensure business continuation.

## What is Artificial Intelligence?

What if your computer could wash your dishes, do your laundry, cook you dinner, and clean your home? I think I can safely say that most people would be happy to get a helping hand! But what would it take for a computer to be able to perform these tasks in the same way that humans can?

The famous computer scientist Alan Turing proposed the Turing Test as a way to identify whether a machine could have intelligence indistinguishable from that of a human being. The test involves a human posing questions to two hidden entities, one human, and the other a machine, and trying to identify which is which. If the interrogator is unable to identify the machine, then the machine is considered to have human-level intelligence.

While Turing’s definition of intelligence sounds reasonable, at the end of the day what constitutes intelligence is fundamentally a philosophical debate. Computer scientists have, however, categorized certain types of systems and algorithms into branches of AI. Each branch is used to solve certain sets of problems. These branches include the following examples, as well as many others:
- Logical and probabilistic deduction and inference based on some predefined knowledge of a world. e.g. Fuzzy inference can help a thermostat decide when to turn on the air conditioning when it detects that the temperature is hot and the atmosphere is humid
- Heuristic search. e.g. Searching can be used to find the best possible next move in a game of chess by searching all possible moves and choosing the one that most improves your position
- Machine learning (ML) with feedback models. e.g. Pattern-recognition problems like OCR.

In general, ML involves using large data sets to train a system to identify patterns. The training data sets may be labelled, meaning the system’s expected outputs are specified for given inputs, or unlabeled meaning expected outputs are not specified. Algorithms that train systems with unlabeled data are called unsupervised algorithms and those that train with labelled data are called supervised. Many ML algorithms and techniques exist for creating OCR systems, of which ANNs are one approach.


## What are Artificial Neural Networks (ANNs)?
 
An ANN is a structure consisting of interconnected nodes that communicate with one another. The structure and its functionality are inspired by neural networks found in a biological brain. Hebbian Theory explains how these networks can learn to identify patterns by physically altering their structure and link strengths. Similarly, a typical ANN (shown in Figure) has connections between nodes that have a weight which is updated as the network learns. The nodes labelled "+1" are called biases. The leftmost blue column of nodes is input nodes, the middle column contains hidden nodes, and the rightmost column contains output nodes. There may be many columns of hidden nodes, known as hidden layers.

![ANN](https://github.com/Meghasrao/Data-Science-Portfolio/blob/main/Project%20-%202%20-%20OCR/Snaps/Screenshot%202021-04-07%20162218.jpg)

## Gradient Descent
This is a Machine Learning optimization technique to find the most optimal set of parameters for a given problem. Plotting here, some cost function measurements of the error of the learning system. In supervised learning, feeding your model with a group of parameters in some ways to tune your model. We need to identify different values in the parameters. So, it produces optimal results.

Hence, in gradient descent we pick some points at random. These represent, some set of parameters to your model. We measure the area of the point that produces on our system. We gradually move down the curve trying a different set of parameters here. New set of parameters might produce minimum error than the previous one. Then we continue the same and then we hit the bottom of the gradient. Here least error is observed pointing out that we hit the bottom of the curve. This is how we train our model to get optimal results.

![GD](https://github.com/Meghasrao/Data-Science-Portfolio/blob/main/Project%20-%202%20-%20OCR/Snaps/Screenshot%202021-04-07%20162903.jpg)


# SOLUTION STATEMENT

The following OCR is explored in following ways:
1.	OCR in Python language using ANN.
2.	Develop a program that can read the image data and predict the characters.
3.	It must also determine if a predicted character matches the actual one or not.

Consider we divide this in following parts:

### PART I: 
Visualizing characters in an OCR database 
Developing an OCR application that recognizes text from image data and visualizes it by converting it into 2D images.


### Part II: 
Building an OCR Engine
•	Develop OCR engine using ANN. 
•	Providing image dataset as input
•	Split those into training and test data
•	70% training data (labelled)
•	30% test data (unlabeled)

## PREREQUISITES

1.	Working station with Windows latest version.
2.	Anaconda Navigator – Includes latest version of spyder (4+) and following packages: OpenCV, neurolab previously installed.
3.	Data File: `Letter.data` copied to your directory



